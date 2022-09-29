// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract Logger {
    // it's a way for designer to say "any child of the abstract contract has to implement specified method"
    uint public testNum;
    constructor(){
        testNum = 1000;
    }
    function emitLog() public pure virtual returns(bytes32);

    function test3() private pure returns(uint){
        return 100;
    }
}
