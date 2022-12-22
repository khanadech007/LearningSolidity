// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

contract SendWithdrawMoney{
    address owner;
    uint public balanceReceived;

    constructor(){
        owner = msg.sender; //called once and cannot be called again
    }

    function deposit() public payable{
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance; //this use to prevent wrong data when call
        // because We cannot prevent contract from receiving ETHER

    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);

        to.transfer(getContractBalance());
    } 

    function withdrawToAddress(address payable to) public{
        to.transfer(getContractBalance());
    }

    function withdrawAmountToAddress(address payable to, uint _amnt) public { 
        if(_amnt <= getContractBalance()){
            to.transfer(_amnt);
        }
    }

}
