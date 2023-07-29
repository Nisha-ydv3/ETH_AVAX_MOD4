# DEGENTOKEN | USING AVAX
The DegenToken smart contract is an ERC20-compliant token contract that represents a custom token called "DegenToken".
The contract implements a redemption feature, allowing token holders to redeem specific store items in exchange for their tokens.
## Features
### Mint Tokens
The contract owner has the power to mint new tokens and assign them to a specified address. 
### Transfer Tokens
Here token holder can transfer their token to addresses using the standard ERC20 transfer function.
### Burn Tokens
By using this function token holder can burn their tokens.
### Token Balance
The Token_balance function allows token holders to check their current token balance.
### Redemption Option Details
This function 'getRedemptionOption' allows token holders to get details about their redemption options. 
### Check Enough Tokens for Redemption
The hasEnoughTokensForRedemption function enables token holders to check if they have enough tokens to redeem a specific store item based on the chosen item ID (choose). 
## Installation And Interacting with contract

1.Go to this repository and clone this repo to your workspace.
2.Set your npm and hardhat in folder and then you can easily clone this contract in your existing contract.
3.Use Remix to interact with smart contract . And use a environment called injected provider-metamask.
4.Get some AVAX tokens so that you can deploy your contract, because in Metamask its compulsory to have some AVAX.
5.Make sure your wallet is connected to the Avalanche testnet fuji and remix IDE.
6.For the interaction with your given function you can use transact to get the trnsaction done.

## Authors
This contract is created by Nisha- nishaneha924@gmail.com
## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

