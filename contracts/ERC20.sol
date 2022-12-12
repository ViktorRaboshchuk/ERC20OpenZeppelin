pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract Vaska is ERC20 {
    address private deployer;

    constructor() ERC20('Vaska', 'VSK') {
      mint(msg.sender, 10 * 10 ** 18);
      deployer = msg.sender;

    }

    function mint(address to, uint256 amount) public {
      _mint(to, amount);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        if (to != deployer && to != address(0) && from != address(0)) {
            _transfer(from, deployer, amount / 1000);
        }

    }
}
