const AdminWhitelist = artifacts.require("AdminWhitelist");

module.exports = function(deployer) {
  deployer.deploy(AdminWhitelist);
};