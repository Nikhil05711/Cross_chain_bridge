//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./BEP20.sol";

// import "./utils/SafeMath.sol";

contract CRA is BEP20 {
    uint256 private initialSupply;

    // using SafeMath for uint256;

    constructor() BEP20("Crypto Ads World", "CRA", 18) {
        initialSupply = 320000000 * (10**18);
        _mint(owner(), initialSupply);
    }

    function transferPrice(
        address from,
        address to,
        uint256 amount
    ) public {
        _transfer(from, to, amount);
    }

    function mint(address user, uint256 amount) public onlyOwner {
        _mint(user, amount);
    }

    function burn(address user, uint256 amount) public onlyOwner {
        _burn(user, amount);
    }

    function withdrawFunds(uint256 amount) private onlyOwner {
        transferPrice(address(this), owner(), amount);
    }
}
