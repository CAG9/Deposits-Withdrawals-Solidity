//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleFallback {

    uint public lastValueSent;
    string public lasFunctionCalled;

    // it only rely on 2300 gas wich is really low, it's called the steepened
    // just avalue without data hit the receive date 
    receive() external payable{
        lastValueSent = msg.value;
        lasFunctionCalled = "receive";
    }
    // if there is data we need a fallback function
    // if you want the proper function to receive a value add the payable
    // be careful it can not get more than 2300 gas
    fallback() external payable{
        lastValueSent = msg.value;
        lasFunctionCalled = "fallback";
    }   
    // if you have fallback but no receive will call fallback
}
