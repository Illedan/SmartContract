pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/NumberStorage.sol";

contract TestNumberStorage {

  function testGettingNumber() public {
    NumberStorage ns = new NumberStorage();

    uint256 expected = 0;

    Assert.equal(ns.retrieve(), expected, "Owner should have 0 stored initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    NumberStorage ns = new NumberStorage();
    uint256 expected = 42;

    ns.store(expected);

    Assert.equal(ns.retrieve(), expected, "Owner should have 42 after insert");
  }
}
