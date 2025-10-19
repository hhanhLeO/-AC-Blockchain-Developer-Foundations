import { ethers } from "ethers";

async function main() {
  const provider = new ethers.JsonRpcProvider("https://eth-sepolia.public.blastapi.io");

  const abi = [
    "function balanceOf(address owner) view returns (uint256)"
  ];
  const contractAddress = "0x7b8264e70da23ca6729fd6b25899dd25a769798d";
  const contract = new ethers.Contract(contractAddress, abi, provider);

  const balance = await contract.balanceOf("0x6731239daeA04426ce328c56AE0a0927fF4799cb");
  console.log("Balance: ", balance); // 1000000000000000000000000000n
}

main().catch(console.error);