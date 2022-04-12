var Example = artifacts.require('./Example.sol')
var Web3 = require('web3')
var web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'))
  
contract('Example', (accounts) => {
    it("Recover", async function () {
        var instance = await Example.deployed()
        var address = accounts[0]
        console.log("address",address)
        var msg = web3.utils.sha3('0xBBB82A7Eb7cfC50bDaDf75074DCFb07379D751f1', address)
        var sig = web3.utils.sha3(msg)
        console.log("h: ", h)
        var sig = await web3.eth.sign(h, address)   
        console.log("sig: ", sig)
        var r = `${sig.slice(0, 64)}`
        console.log("r: "+r)
        var s = `0x${sig.slice(64, 128)}`
        console.log("s: "+s)
        var v = web3.utils.toDecimal(`0x${sig.slice(128, 130)}`) + 27
        console.log("v: "+v)
        var result = await instance.getIsValidAccessAddress.call(address, v, r, s)
        assert.equal(result, address, "Wrong result")
      });
})