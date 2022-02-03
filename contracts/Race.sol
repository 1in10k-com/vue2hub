//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Race {
    uint256 public dognum;

    constructor(uint256 _dognum) {
        console.log("Deploying a Race with race:");
        dognum = _dognum;
    }

    function getDognum() public view returns (uint256) {
        return dognum;
    }

    function setDogmum() public payable {
        dognum =
            dognum +
            uint256(
                (uint256(
                    keccak256(
                        abi.encodePacked(block.timestamp, block.difficulty)
                    )
                ) % 6) + 1
            );
    }
}
