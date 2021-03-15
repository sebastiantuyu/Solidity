const Ponzi = artifacts.require("PonziScheme")

module.exports = function (deployer) {
    deployer.deploy(Ponzi);
    const ponzi = await Ponzi.deployed();

    await ponzi.transfer(accounts[1],'1000000000000000000');
    
};