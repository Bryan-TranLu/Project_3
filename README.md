<h1 align="center">Project 3</h1>

## Table of Contents

- [Description](#description)
- [Background](#background)
- [Dataset Features](#dataset_features)
- [Installation Requirements](#installation-requirements)
- [Approach](#approach)
- [Contributors](#contributors)
- [Sources](#sources)
- [License](#license)

## Description
This is a project in which we attempt to create a NFT market place where users can sell and buy homes.

## Background

## Technologies
Remix IDE
Web3
Streamlit


## Usage
It is less overwhelming to interact with the app on the user interface by running the command `streamlit run FILENAME.py` in your terminal. Note: Make sure you are in the proper directory when you run this. Once you run this command, a webpage will open where you can intuitively interact with the code. However, more for tech-savvy users you can check out the solidity file, compile, and deploy it to see the mechanisms of the backend code.

### Code
Code for the backend is primarily stored in the XXXX.sol file LINK HERE. Therein, the contract RealEstateToken is created.
There are certain functions which are important to highlight for anyone who wants to interact with the backend code which I will do so describing the typical workflow:

- `registerHouse` enables a user to enter their real-world house address to apply for a token
- Upon registering their house, the user has to wait for approval from the admin (the deployer of the contract) before utilizing most functions
- Admin can use `getPendingTokens` to see all the tokens that are pending
- Admin can approve or reject tokens using the `setTokenStatus` function by entering the respective TokenID and a 1 for approval or 2 for rejection
- Once a token is approved, the owner can do nothing or `addTokenForSale` where you specify the token you are listing and its price in ether
- If a buyer is identified, the seller can then use the ERC721 standard `approve` function to allow permissions to a certain address to purchase the token
- Once approved, the buyer can then use the `purchaseNFT` function to specify the token they want to buy and send the appropriate amount of ether (whatever the list price was)

Other useful functions mainly for browsing the marketplace or querying token and address info:
- `getApprovedTokensForAddress` allows one to see the tokenIDs that have been approved for a specfic address
- `getUserTokens` allows one to see all tokenIDs associated with a wallet regardless of status
- `getTokensForSale` allows one to see any tokenIDs currently listed and their associated prices
- ERC721 function `tokenURI` maps tokenID to URI string (the house address)
- ERC721 function `ownerOf` allows you to see the address owning any given tokenID





### Run the Code

To run the code, make sure that you compile the code with the proper compiler, and deploy in any of the Remix VM environments offered. After deploying, expand the "Deployed Contracts" section and use the buttons and value fields to accomplish your goals. You can then run the user interface version of the app by running the command `streamlit run FILENAME.py`

## Contributors

Code in solidity by Vadim Yermak, Bryan Lu, and Will Colwell. Code in python written by Philip Timothe and Moises Coriat.

## License

MIT License

Copyright (c) [2023]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
