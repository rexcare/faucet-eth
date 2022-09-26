// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    uint numberOfFounders;
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

   receive() external payable {

   }

   function addFunds() external payable {
      address funder = msg.sender;
       if(!funders[funder]){
           uint index = numberOfFounders++;
           funders[funder] = true;
           lutFunders[index] = funder;
       }
   }

    function getAllFunders() public view returns(address[] memory){
        address[] memory _funders = new address[](numberOfFounders);
        for(uint i = 0; i < numberOfFounders; i++){
            _funders[i] = lutFunders[i];
        }
        return _funders;
    }

    function getFunderAtIndex(uint index) external view returns(address){
        return lutFunders[index];
    }


}
