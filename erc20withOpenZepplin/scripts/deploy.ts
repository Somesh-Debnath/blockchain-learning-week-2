const hre=require("hardhat");

async function sleep(ms:any) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function main() {
    const Token = await hre.ethers.getContractFactory("Token",[],{});
    const token = await Token.waitForDeployment();

    console.log("Token deployed to:", token.address);
    console.log("Token deployed by:", token.deployTransaction.from);

    await sleep(5*1000);

    await hre.run("verify:verify", {
        address: token.address,
        constructorArguments: [],
    });

    console.log("Token verified");

    main().then(() => process.exit(0)).catch(error => {
        console.error(error);
        process.exit(1);
    });
}

