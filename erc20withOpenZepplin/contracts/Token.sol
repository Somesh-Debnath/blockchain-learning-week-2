// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Token is ERC20Capped, ERC20Burnable {
    // Address of the owner (payable)
    address payable public owner;

    // Constructor to initialize the token with specific parameters
    constructor()
        ERC20("Token", "TKN") // Set token name and symbol
        ERC20Capped(1000000 * (10 ** decimals())) // Set the cap for total token supply
    {
        owner = payable(msg.sender);

        // Mint an initial supply and assign it to the owner
        _mint(owner, 7000000 * (10 ** decimals()));
    }

    modifier onlyOwner() {
        // Only allow the owner to proceed
        require(msg.sender == owner, "Not owner");
        _;
    }

   //mint tokens
    function mint( uint256 amount) public onlyOwner {
        _update(address(0), owner, amount);
    }

    function mintTo(address account, uint256 value) public {
        // Check if the specified account is a valid address
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }

        // Call the _update function to mint tokens to the specified account
        _update(address(0), account, value);
    }

    //check balance
    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }

    //check total supply
    function totalSupply() public view override returns (uint256) {
        return super.totalSupply();
    }

    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override(ERC20, ERC20Capped) {
        // Call the _update functions from ERC20 and ERC20Capped
        super._update(from, to, value);

        // Check if the tokens are minted to the owner (from address(0) to owner)
        if (from == address(0) && to == owner) {
            // Check if the total supply exceeds the maximum cap
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert ERC20ExceededCap(supply, maxSupply);
            }
        }
    }
}