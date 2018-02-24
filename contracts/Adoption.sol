pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Adoption is ERC721Token, Ownable {

  string constant public NAME = "HEROS";
  string constant public SYMBOL = "HERO";
  uint256 constant public PRICE = .001 ether; 
  address[16] public adopters;
  mapping(uint256 => uint256) tokenToPriceMap;


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
