// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./libs/BEP20.sol";
import '@openzeppelin/contracts/math/SafeMath.sol';

// TRVC Token.
contract TRVC is BEP20("Trivechain", "TRVC") {

    using SafeMath for uint256;

    uint256 private _maximumSupply = 80000000000000000000000000;

    function maximumSupply() public view returns (uint256) {
        return _maximumSupply;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(totalSupply().add(_amount) <= _maximumSupply, "Maximum Supply Reached");
        _mint(_to, _amount);
    }

    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
        _maximumSupply = _maximumSupply.sub(_amount);
    }
}