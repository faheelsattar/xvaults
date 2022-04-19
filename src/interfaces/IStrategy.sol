// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

//strategies that help generating yield
interface IStrategy {
    function consume(uint256 asset) external returns (uint256 amount);

    function harvest() external returns(uint256 amount)
}
