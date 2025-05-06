require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: process.env.SESSION_SECRET || 'your_strong_secret_key',
  resave: false,
  saveUninitialized: false,
  cookie: { secure: false }
}));
app.use(express.static(path.join(__dirname, 'src')));

// Admin credentials
const ADMIN_CREDENTIALS = {
  username: 'admin',
  password: 'admin123' // Note: This is 'admin123' not 'admin1234'
};

// Login handler - now properly handles form submission
app.post('/admin-login', (req, res) => {
  const { username, password } = req.body;
  
  console.log('Login attempt:', username, password); // Debug logging
  
  if (username === ADMIN_CREDENTIALS.username && password === ADMIN_CREDENTIALS.password) {
    req.session.loggedIn = true;
    return res.redirect('/admin/index.html');
  }
  
  // Send a proper error response that will redirect back
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
      <title>Login Failed</title>
      <script>
        alert('Invalid credentials. Please use admin/admin123');
        window.location.href = '/admin_auth.html';
      </script>
    </head>
    <body>
    </body>
    </html>
  `);
});

// Protected admin route
app.get('/admin/index.html', (req, res) => {
  if (!req.session.loggedIn) {
    return res.redirect('/admin_auth.html');
  }
  res.sendFile(path.join(__dirname, 'src/admin/index.html'));
});

// Login page route
app.get('/admin_auth.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'src/admin_auth.html'));
});

// Start server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
  console.log('Try logging in with admin/admin123');
});