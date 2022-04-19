// SPDX-License-Identifier: AGPL-3.0-only
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

//interfaces
import {IStrategy} from "./interfaces/IStrategy.sol";

contract XVault is ERC4626 {
    //perfomance fees
    uint256 public fee;

    struct StrategyData {
        //total bit packed = 8 + 248 = 256
        bool trusted; //8 bits
        uint248 balance; //248 bits
    }

    mapping(IStrategy => StrategyData) public queryStrategy;

    constructor(ERC20 _asset)
        ERC4626(
            _asset,
            // ex: X Dai Stablecoin Vault
            string(abi.encodePacked("X", _asset.name(), " Vault")),
            // ex: XDAI
            string(abi.encodePacked("X", _asset.symbol()))
        )
    {}
}
