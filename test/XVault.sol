// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

import "src/XVault.sol";

contract TestContract is Test {
    XVault v;

    function setUp() public {
        v = new XVault();
    }

    function testBar() public {
        assertEq(uint256(1), 2, "ok");
    }

    function testFoo(uint256 x) public {
        vm.assume(x < type(uint128).max);
        assertEq(x + x, x * 2);
    }
}
