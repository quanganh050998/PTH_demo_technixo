const Coin=artifacts.require('Coin');
const { assert } = require('chai');

let contractInstance;

contract('Coin', (accounts) =>{
    before(async =>{
        contractInstance = await Coin.deployed();
    })

    describle('Check deploy network', () =>{
        it('Check deploy', async () =>{
            const result= await Coin.deployed();
            assert.isObject(result);
        }) 
    })
})