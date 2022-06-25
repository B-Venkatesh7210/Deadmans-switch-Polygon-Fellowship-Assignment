//Deployed the contract on Goerli Test Network using Remix IDE

//Contract Address = 0x749161aca182d38220a1e6aa5Da51fEA2b15fF1A

// SPDX-License-Identifier: GPL-3.0 
pragma solidity 0.8.7;

contract DeadmansSwitch {
    address public owner;
    address payable presetAddress;
    uint256 public blockNum;

    constructor() payable {
        owner = msg.sender;
        presetAddress = payable(0xF2B7CfDb834Bf075144ca9E309Ff0AE0B7860AC8);
        blockNum = block.number;
    }

    function still_alive() public {
        require(block.number-blockNum<=10, "Block number exceeded");
        blockNum =block.number;
    }

    function showBlockNum() public view returns(uint256){
        return blockNum;
    }
    
    function transfer() public {
        require(block.number-blockNum>10, "Contract is still alive");
        presetAddress.transfer(address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
}