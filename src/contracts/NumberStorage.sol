// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

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