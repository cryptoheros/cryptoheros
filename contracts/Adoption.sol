pragma solidity ^0.4.17;

contract Adoption {

  address[16] public adopters;

  // Adopting a hero
  function adopt(uint heroId) public returns (uint) {
  require(heroId >= 0 && heroId <= 15);

  adopters[heroId] = msg.sender;

  return heroId;
  }

  // Retrieving the adopters
  function getAdopters() public view returns (address[16]) {
  return adopters;
  }

}
