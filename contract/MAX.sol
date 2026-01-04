// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MAX is ERC20, Ownable {
    uint8 private constant _DECIMALS = 6;

    // 10,000,000,000 MAX with 6 decimals
    uint256 public constant INITIAL_SUPPLY =
        10_000_000_000 * (10 ** uint256(_DECIMALS));

    constructor() ERC20("MAX", "MAX") Ownable(msg.sender) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function decimals() public pure override returns (uint8) {
        return _DECIMALS;
    }

    // Minting kept (owner-controlled). Amount is in whole tokens.
    function mint(address to, uint256 amountWholeTokens) external onlyOwner {
        _mint(to, amountWholeTokens * (10 ** uint256(_DECIMALS)));
    }

    function burn(uint256 amountWholeTokens) external {
        _burn(msg.sender, amountWholeTokens * (10 ** uint256(_DECIMALS)));
    }
}