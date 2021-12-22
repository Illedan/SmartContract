const NumberStorage = artifacts.require("NumberStorage");


contract('NumberStorage', (accounts) => {
    it('should have 0 initially', async () => {
      const numberStorageInstance = await NumberStorage.deployed();
      const number = await numberStorageInstance.retrieve({ from: accounts[0] });


      assert.equal(number.valueOf(), 0, "0 was the wrong number of the account");
    });
    it('should update number correctly for each account', async () => {
      const numberStorageInstance = await NumberStorage.deployed();
  
      // Setup 2 accounts.
      const accountOne = accounts[0];
      const accountTwo = accounts[1];
  
      await numberStorageInstance.store(1, { from: accounts[0] });
      await numberStorageInstance.store(2, { from: accounts[1] });
      
      const number1 = await numberStorageInstance.retrieve({ from: accountOne });
      const number2 = await numberStorageInstance.retrieve({ from: accountTwo });
      assert.equal(number1.valueOf(), 1, "1 was the wrong number of the first account");
      assert.equal(number2.valueOf(), 2, "2 was the wrong number of the second account");
    });
  });
  