# Block ICO Contract

This is a simple Solidity smart contract that implements an ICO (Initial Coin Offering) for the "Block" token. The ICO allows investors to purchase "Block" tokens using Ether.

## Features

- ERC20 Interface: The contract implements the ERC20 standard functions for transferring and managing tokens.
- ICO Functionality: Allows investors to participate in the ICO by sending Ether to the contract and receiving "Block" tokens in return.
- ICO Time Period: The ICO has a specific start and end time, and investors can participate only during the active period.
- ICO Cap: The total amount of Ether that can be raised during the ICO is capped at 300 Ether.
- Manager Control: The contract manager can halt and resume the ICO, change the deposit address, and burn tokens after the ICO ends.

## Contracts

### `Block.sol`

The `Block.sol` contract implements the ERC20 token functionality for the "Block" token.

### `ICO.sol`

The `ICO.sol` contract extends the `Block.sol` contract and adds the ICO functionality.

## Getting Started

To participate in the ICO and obtain "Block" tokens, you need to send Ether to the contract address during the ICO period.

### ICO Details

- Token Name: Block
- Token Symbol: Blk
- Token Decimal: 0
- Total Supply: 10,000,000

### ICO Parameters

- Token Price: 0.1 Ether per token
- ICO Cap: 300 Ether
- ICO Start Time: [Start Time - Insert Timestamp]
- ICO End Time: [End Time - Insert Timestamp]
- Token Trade Time: [Trade Time - Insert Timestamp]
- Minimum Investment: 0.1 Ether
- Maximum Investment: 10 Ether

## How to Use

1. Connect to your Ethereum wallet that supports ERC20 tokens (e.g., Metamask).
2. Send Ether to the contract address during the ICO period.
3. You will receive "Block" tokens to your wallet address based on the amount of Ether sent and the token price.
4. Ensure that you are sending the Ether from a compatible wallet that can interact with smart contracts.
5. After the ICO ends, you can trade your "Block" tokens freely.

## Developer Information

This project is provided under the MIT License. Feel free to contribute, raise issues, or provide feedback.

## Security Notice

The contract provided here is for educational and illustrative purposes only. Use it with caution, and do not use it in a production environment without proper security audits and testing.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

MIT License

Copyright (c) [2023] [Gurkirat]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
