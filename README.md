🏗️ Universal Token Factory

This smart contract project allows anyone to generate custom **ERC-20** (fungible) and **ERC-721** (non-fungible) tokens directly on the Ethereum blockchain or other EVM-compatible networks. It serves as a decentralized token creation hub for launching utility tokens, NFT collections, or other blockchain assets.

## ⚙️ Functionality Overview

- 🪙 **ERC-20 Token Creation**
  - Customize token name, symbol, and total supply.
  - Instantly deploy your own fungible token contract.

- 🎨 **ERC-721 NFT Contract Creation**
  - Deploy a new ERC-721 contract with minting capability.
  - Metadata URI support enables image, name, and trait integration for NFTs.
  - Owner-only minting ensures control over asset creation.

- 📦 **Factory Contract**
  - Keeps a record of all deployed token contracts.
  - Emits events for easy on-chain indexing.

## 🔧 Implementation & Working Steps

1. **Deploy the TokenFactory contract.**

2. **Create an ERC-20 token:**
   - Call `createERC20(name, symbol, supply)`
   - A new ERC-20 contract is deployed and its address stored in `erc20Tokens`.

3. **Create an ERC-721 contract:**
   - Call `createERC721(name, symbol)`
   - A new NFT contract is deployed and stored in `erc721Tokens`.

4. **Mint an NFT (from deployed ERC-721):**
   - Call `mintNFT(recipient, tokenURI)` from the deployed contract.
   - `tokenURI` should point to your token's metadata (e.g., IPFS link).

5. **View deployed tokens:**
   - Use `getERC20Tokens()` and `getERC721Tokens()` to retrieve deployed contract addresses.

## 📚 Standards Used

- ERC-20: For fungible token behavior.
- ERC-721: For NFTs with metadata URI support.
- OpenZeppelin's `ERC721URIStorage` and `Ownable` modules are used for standardization and access control.
