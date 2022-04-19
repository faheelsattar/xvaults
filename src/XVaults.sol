// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

//]Mixins
import {ERC4626} from "solmate/mixins/ERC4626.sol";

//Tokens
import {ERC20} from "solmate/tokens/ERC20.sol";

//Auth
import {Auth} from "solmate/auth/Auth.sol";

//Utils
import {SafeCastLib} from "solmate/utils/SafeCastLib.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";
import {FixedPointMathLib} from "solmate/utils/FixedPointMathLib.sol";

contract XVaults is ERC4626 {
    function deposit(uint256 assets, address receiver)
        public
        override
        returns (uint256 shares)
    {
        // usage: user will deposit a single asset and get relevent lp tokens.
        // sanitize inputs to check for user balance of the asset being deposited
        // calculate shares according to a formula
    }
}
