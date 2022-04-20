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

//custom errors
error FeeToHigh();

contract XVault is ERC4626 {
    //perfomance fees
    uint256 public fee;

    uint256 public maxStrategies;

    struct StrategyData {
        bool trusted;
        uint248 balance;
    }

    mapping(IStrategy => StrategyData) public queryStrategy;

    //events

    event FeeUpdated(address indexed user, uint256 newFeePercent);

    constructor(ERC20 _asset)
        ERC4626(
            _asset,
            // ex: X Dai Stablecoin Vault
            string(abi.encodePacked("X", _asset.name(), " Vault")),
            // ex: XDAI
            string(abi.encodePacked("X", _asset.symbol()))
        )
    {}

    function initialize(uint256 _fee, uint256 _maxStrategies) external {
        fee = _fee;
        maxStrategies = _maxStrategies;
    }

    //set fee percentage
    function setFeePercent(uint256 _fee) external {
        if (_fee > 1e18) revert FeeToHigh();
        fee = _fee;
        emit FeeUpdated(msg.sender, _fee);
    }
}
