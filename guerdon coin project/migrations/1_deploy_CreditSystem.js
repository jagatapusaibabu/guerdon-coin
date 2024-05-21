const CreditSystem = artifacts.require('CreditSystem');
module.exports = function(deployer){
    deployer.deploy(CreditSystem);
}