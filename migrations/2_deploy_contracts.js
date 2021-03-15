const Ponzi = artifacts.require("PonziScheme")

module.exports = async function (deployer, network, accounts) {
    await deployer.deploy(Ponzi);
    const ponzi = await Ponzi.deployed();
    
};