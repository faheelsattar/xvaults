// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

//Mixins
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
    
}
