# 🎓 Degree Verification System using Blockchain

A decentralized web application (DApp) for secure and tamper-proof academic degree verification using the Ethereum blockchain.

---

## 📌 Overview

This project addresses the widespread issue of fake academic credentials by introducing a blockchain-powered verification platform. Educational institutions can add degree records to the blockchain, and third parties (like employers or universities) can instantly verify their authenticity via a QR code. This eliminates the need for manual verifications and ensures transparency, security, and immutability.

The system includes:

* Smart contracts for immutable storage of degree data
* An Admin portal to add verified degrees
* A Verifier portal with a QR scanner to validate degrees

---

## 🚀 Features

* 🔒 Immutable degree records stored on Ethereum blockchain
* 🧾 Admin interface for inputting degree data and generating hash + QR code
* 📷 QR code scanning to extract hash and verify on-chain
* 🛠️ Easy deployment with Truffle + Ganache
* 🌐 Fully decentralized interaction with MetaMask + Web3.js

---

## 🛠️ Tech Stack

**Frontend:**

* HTML, CSS, JavaScript
* QR code scanner: `html5-qrcode`

**Backend:**

* Node.js, Express.js

**Blockchain:**

* Solidity (Smart Contract)
* Truffle Framework
* Ganache (local blockchain simulation)
* Web3.js (Ethereum interaction)

**Other Tools:**

* MetaMask (wallet)
* QR Code Generator
* Keccak256 (hashing)

---

## 🧩 Project Structure

```
.
├── contracts/                # Smart contract (DegreeVerification.sol)
├── src/                      # Frontend, JS logic
|    ├── admin/               # Admin web page logic
|    ├── verifier/            # Verifier logic
├── server.js                 # Node.js backend
├── truffle-config.js         # Truffle configuration
└── README.md
```

---

## 📦 Installation

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/degree-verification-blockchain.git
cd degree-verification-blockchain
```

### 2. Install dependencies

```bash
npm install
```

### 3. Start Ganache locally

Ensure Ganache is running at `http://localhost:7545`.

### 4. Deploy smart contract

```bash
truffle migrate
```

### 5. Run the backend server

```bash
node server.js
```

### 6. Open the Application

Visit the following URLs:

* Admin Panel: `http://localhost:3000/admin.html`
* Verifier Panel: `http://localhost:3000/verifier.html`

---

## 📷 QR Code Verification Flow

1. **Admin** inputs degree data into the form.
2. A **Keccak256** hash of the degree is generated.
3. The hash is stored on the blockchain via the smart contract.
4. A **QR code** containing the hash is generated and shared with the student.
5. The **Verifier** scans the QR code using the Verifier page.
6. The app fetches the hash and checks if it exists on the blockchain.
7. If valid, verification is successful.

---

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more information.

---

## 🙌 Author

**Abhinav Pathania**
[LinkedIn](https://www.linkedin.com/in/abhinav-pathania/)
📧 [abhinavpathania.work@gmail.com](mailto:abhinavpathania.work@gmail.com)
