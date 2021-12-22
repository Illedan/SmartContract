// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

contract NumberStorage {

    mapping (address => uint256) numbers;

    constructor() public {
		numbers[tx.origin] = 0;
	}

    function store(uint256 num) public {
        numbers[msg.sender] = num;
    }

    function retrieve() public view returns (uint256){
        return numbers[msg.sender];
    }
}