// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";
import "./interfaces/IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {

    uint numberOfFounders;
    uint withdrawLimit = 1000000000000000000;

    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function changeWithdrawLimit(uint _withdrawLimit) external onlyOwner {
            withdrawLimit = _withdrawLimit;
    }

    modifier limitWithdraw(uint withdrawAmount){
        require(withdrawAmount > withdrawLimit, "cannot withdraw this amount");
        _; // trigger function if require not
    }

    function addFunds() override external payable {
        address funder = msg.sender;
        if(!funders[funder]){
            uint index = numberOfFounders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdraw(uint withdrawAmount) override external limitWithdraw(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() public view returns(address[] memory){
        address[] memory _funders = new address[](numberOfFounders);
        for(uint i = 0; i < numberOfFounders; i++){
            _funders[i] = lutFunders[i];
        }
        return _funders;
    }


   receive() external payable {

   }

    function emitLog() public override pure returns(bytes32){
        return "hello world";
    }

    function getFunderAtIndex(uint index) external view returns(address){
        return lutFunders[index];
    }


}
