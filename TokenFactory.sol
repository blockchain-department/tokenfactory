// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// Minimal ERC-20 Implementation
contract CustomERC20 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;

    constructor(string memory _name, string memory _symbol, uint256 _supply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _supply * (10 ** uint256(decimals));
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
    }
}

// Improved ERC-721 Implementation
contract CustomERC721 is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor(
        string memory _name,
        string memory _symbol,
        address initialOwner
    ) ERC721(_name, _symbol) Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        tokenCounter += 1;
        uint256 newItemId = tokenCounter;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}

// Factory Contract
contract TokenFactory {
    address[] public erc20Tokens;
    address[] public erc721Tokens;

    event ERC20Created(address tokenAddress, string name, string symbol);
    event ERC721Created(address tokenAddress, string name, string symbol);

    function createERC20(string memory name, string memory symbol, uint256 supply)
        public
    {
        CustomERC20 token = new CustomERC20(name, symbol, supply);
        erc20Tokens.push(address(token));
        emit ERC20Created(address(token), name, symbol);
    }

    function createERC721(string memory name, string memory symbol)
        public
    {
        CustomERC721 token = new CustomERC721(name, symbol, msg.sender);
        erc721Tokens.push(address(token));
        emit ERC721Created(address(token), name, symbol);
    }

    function getERC20Tokens() public view returns (address[] memory) {
        return erc20Tokens;
    }

    function getERC721Tokens() public view returns (address[] memory) {
        return erc721Tokens;
    }
}
