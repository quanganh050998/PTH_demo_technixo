const Coin = artifacts.require('Coin');
// const truffleAssert = require('truffle-assertions');
const { assert } = require('chai');

let contractInstance;

contract('Coin', (accounts) => {
    before(async () => {
      contractInstance = await Coin.deployed();
    });

    describe('Deploy', () => {
        it('should deploy success to Ganache network', async () => {
          const result = await Coin.deployed();
          assert.isObject(result);
        });
      });    


  describe('function getBalance()', () => {
    it('should return balance of account exists', async () => {
      const balance = await contractInstance.getBalance(accounts[0]);
      assert.equal(balance, 0);
    });
  });


//   it('should tranfer success if account have enough money', async () => {
//     const _sender = accounts[0];
//     const _receiver = accounts[2];
//     const _amount = 100;

//     // Mint for sender
//     await contractInstance.mint(_sender, _amount);

//     const balanceOfSenderBeforeTransfer = Number(await contractInstance.getBalance(_sender));
//     const balanceOfReceiverBeforeTransfer = Number(await contractInstance.getBalance(_receiver));

//     // Transfer from _sender to _receiver
//     const result = await contractInstance.transfer(_receiver, _amount, {
//       from: _sender
//     });

//     truffleAssert.eventEmitted(result, 'Transfer', (ev) => {
//       return ev._sender === _sender
//         && ev._receiver === _receiver
//         && ev._amount.toNumber() === _amount
//     });

//     const balanceOfSenderAfterTransfer = Number(await contractInstance.getBalance(_sender));
//     const balanceOfReceiverAfterTransfer = Number(await contractInstance.getBalance(_receiver));

//     assert.equal(
//       balanceOfSenderAfterTransfer,
//       balanceOfSenderBeforeTransfer - _amount,
//       'Minus balance sender'
//     );
//     assert.equal(
//       balanceOfReceiverAfterTransfer,
//       balanceOfReceiverBeforeTransfer + _amount,
//       'Add balance receiver'
//     );
//   });

})