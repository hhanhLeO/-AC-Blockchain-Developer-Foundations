import { ethers } from "ethers";

async function main() {
  const provider = new ethers.JsonRpcProvider("https://eth-sepolia.public.blastapi.io");

  const privateKey = "PRIVATE_KEY"; 
  const wallet = new ethers.Wallet(privateKey, provider);

  const abi = [
    "function mint(address to) public",
    "function ownerOf(uint256 tokenId) view returns (address)",
    "function nextTokenId() view returns (uint256)"
  ];
  const contractAddress = "0x2cA4f14B39b8c02480d07b808a3F16b0C8A4a527";
  const contract = new ethers.Contract(contractAddress, abi, wallet);

  console.log("Connected to contract at:", contractAddress);

  // Call mint()
  console.log("Minting NFT...");
  const tx = await contract.mint(wallet.address);
  await tx.wait();
  console.log("Minted NFT successfully!");

  // Call ownerOf(0)
  const owner = await contract.ownerOf(0);
  console.log("Owner of token 0:", owner);

  // Call nextTokenId()
  const nextId = await contract.nextTokenId();
  console.log("Next token ID will be:", nextId.toString());
}

main().catch(console.error);

// Connected to contract at: 0x2cA4f14B39b8c02480d07b808a3F16b0C8A4a527
// Minting NFT...
// Minted NFT successfully!
// Owner of token 0: 0x6731239daeA04426ce328c56AE0a0927fF4799cb
// Next token ID will be: 2