pragma solidity ^0.5.8;

contract RaccoonRegistry {

    mapping(bytes32 => uint) cards;

    //TODO: issuer filtering
    function issueCard(bytes32 digest, uint exp) public {
        cards[digest] = exp;
    }

    function hasCard(bytes32 digest) public view returns (bool) {
        return cards[digest] > block.timestamp;
    }

}