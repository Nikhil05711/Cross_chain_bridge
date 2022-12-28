//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./utils/Ownable.sol";

contract Blacklist is Ownable {
    mapping(address => bool) public isBlacklisted;

    function addBlacklist(address _user) public onlyOwner {
        require(!isBlacklisted[_user], "Error: User already blacklisted");
        isBlacklisted[_user] = true;
    }

    function removeFromBlacklist(address _user) public onlyOwner {
        require(isBlacklisted[_user], "Error: User already whitelisted");
        isBlacklisted[_user] = false;
    }

    function isUserBlacklisted(address _user) private view returns (bool) {
        return isBlacklisted[_user];
    }
}
