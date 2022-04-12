pragma solidity >=0.7.0 <0.9.0;

contract Example{
    
   address public DAOLAUNCH_DEV;

    constructor() {
        DAOLAUNCH_DEV = payable(0x75d69272c5A9d6FCeC0D68c547776C7195f73feA); 
    }

    function getIsValidAccessAddress(address _addr, uint8 _v, bytes32 _r, bytes32 _s) public view returns(address) {
        return isValidAccessMsg(_addr, _v, _r, _s);
    }

    function isValidAccessMsg(
        address _addr,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) internal view returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(address(this), _addr));
        return
            ecrecover(
                keccak256(
                    abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)
                ),
                _v,
                _r,
                _s
            );
    }
     function testRecovery1(address _addr) public view returns (bytes32) {
        bytes32 hash = keccak256(abi.encodePacked(address(this), _addr));
        return hash;
    }
}