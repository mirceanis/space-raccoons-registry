pragma solidity ^0.5.8;

contract RaccoonRegistry {

    mapping(bytes32 => uint) public cards;

    //TODO: issuer filtering
    function issueCard(bytes32 digest, uint exp) public returns (bool) {
        cards[digest] = exp;
        return true;
    }

    function hasCard(address party, bytes32 cardType) public view returns (bool) {
        bytes32 digest = keccak256(abi.encodePacked(party, cardType));
        uint exp = cards[digest];
        return (exp > 0 && exp < block.timestamp);

    }

}