// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

import "src/XVaults.sol";

contract TestContract is Test {
    XVaults v;

    function setUp() public {
        v = new XVaults();
    }

    function testBar() public {
        assertEq(uint256(1), 2, "ok");
    }

    function testFoo(uint256 x) public {
        vm.assume(x < type(uint128).max);
        assertEq(x + x, x * 2);
    }
}
