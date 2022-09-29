// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IFaucet {
  // only can inhereit from other interfaces and not decare state variables and constructors and all function should be external
  function addFunds() external payable;
    function withdraw(uint withdrawAmount) external;
}
