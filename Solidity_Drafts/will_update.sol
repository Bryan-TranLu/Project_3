pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract MyToken is ERC20, ERC20Mintable {
    string public name = "RealEstateToken";
    string public symbol = "RET";
    uint8 public decimals = 18;
    uint256 public tokenPrice = 1e18; 

    constructor() public {
        // Mint initial supply to the contract
        _mint(address(this), 1000000 * (10 ** uint256(decimals)));
    }

    function purchaseTokens() public payable {
        uint256 numberOfTokens = msg.value / tokenPrice; // Calculate the number of tokens based on Ether sent

        require(numberOfTokens > 0, "Insufficient Ether sent"); // Ensure the Ether sent can purchase at least one token
        require(balanceOf(address(this)) >= numberOfTokens, "Not enough tokens available for purchase");

        // Transfer tokens to the buyer
        _transfer(address(this), msg.sender, numberOfTokens);

        // Transfer any excess Ether back to the sender
        uint256 excessEther = msg.value - (numberOfTokens * tokenPrice);
        if (excessEther > 0) {
            msg.sender.transfer(excessEther);
        }
    }
}
