pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
 
  // Testing the adopt() function
  function testUserCanAdoptHero() public {
  uint returnedId = adoption.adopt(8);

  uint expected = 8;

  Assert.equal(returnedId, expected, "Adoption of hero ID 8 should be recorded.");
  }

  // Testing retrieval of a single heros owner
  function testGetAdopterAddressByHeroId() public {
  // Expected owner is this contract
  address expected = this;

  address adopter = adoption.adopters(8);

  Assert.equal(adopter, expected, "Owner of hero ID 8 should be recorded."); 
  }
 
  // Testing retrieval of all hero owners
  function testGetAdopterAddressByHeroIdInArray() public {
  // Expected owner is this contract
  address expected = this;

  // Store adopters in memory rather than contract's storage
  address[16] memory adopters = adoption.getAdopters();

  Assert.equal(adopters[8], expected, "Owner of hero ID 8 should be recorded.");
  }

}
