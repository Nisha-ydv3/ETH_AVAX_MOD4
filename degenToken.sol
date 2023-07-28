// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    struct RedemptionOption {
        string itemName;
        uint256 requiredTokens;
        uint256 choose;
    }

    mapping(address => RedemptionOption) public redemptionOptions;

    string[] private _storeItems;

    constructor() ERC20("DegenToken", "DEG") {
        _storeItems.push("DEGEN TOKEN");
        _storeItems.push("CODE OF COUPON");
        _storeItems.push("NISHA");
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }
 function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function getStoreItems() public view returns (string[] memory) {
        return _storeItems;
    }

    function redeemItem(uint256 choose) public {
        require(choose >= 1 && choose <= _storeItems.length, "Invalid option");

        uint256 requiredTokens;
        string memory itemName;

        if (choose == 1) {
            requiredTokens = 100;
            itemName = _storeItems[0];
        } else if (choose == 2) {
            requiredTokens = 150;
            itemName = _storeItems[1];
        } else if (choose == 3) {
            requiredTokens = 200;
            itemName = _storeItems[2];
        } else {
            revert("Invalid option");
        }

        require(balanceOf(msg.sender) >= requiredTokens, "Insufficient tokens");
        _burn(msg.sender, requiredTokens);

        redemptionOptions[msg.sender] = RedemptionOption(itemName, requiredTokens, choose);
    }

    function burnTokens(uint256 amount) public {
        uint256 balance = balanceOf(msg.sender);
        require(balance >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
    }

    function Token_balance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Get details of the redemption option
    function getRedemptionOption(address account) public view returns (RedemptionOption memory) {
        return redemptionOptions[account];
    }

    // Check if the sender has enough tokens for redemption option
    function hasEnoughTokensForRedemption(uint256 choose) public view returns (bool) {
        if (choose < 1 || choose > _storeItems.length) {
            return false;
        }

	    uint256 requiredTokens;
        if (choose == 1) {
            requiredTokens = 100;
        } else if (choose == 2) {
            requiredTokens = 150;
        } else if (choose == 3) {
            requiredTokens = 200;
        } else {
            return false;
        }

        return balanceOf(msg.sender) >= requiredTokens;
    }
}
