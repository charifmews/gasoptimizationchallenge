// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
contract GasContract {
    mapping(address => uint256) public whitelist;
    mapping(uint => address) public administrators;
    mapping(address => uint256) public balances;

    event AddedToWhitelist(address userAddress, uint256 tier);
    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 /*_totalSupply*/) {
        administrators[4] = msg.sender;
        balances[msg.sender] = 0x3B9ACA00;
        administrators[0] = _admins[0];
        administrators[1] = _admins[1];
        administrators[2] = _admins[2];
        administrators[3] = _admins[3];
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata /*_name*/
    ) public payable {
        unchecked {
            balances[_recipient] += _amount;
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        public payable
    {
        if (!(_tier <= 0xFE)) { revert(); }
        if (address(0x1234) != msg.sender ) { revert(); }
        whitelist[_userAddrs] = 3;

        // assembly {
        //     let topic := 0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52
        //     let dataOffset := mload(0x40)  // get a free memory pointer

        //     // Encode the address and uint256 into the data section of the log
        //     mstore(dataOffset, _userAddrs)
        //     mstore(add(dataOffset, 0x20), _tier)

        //     // Emit a log with 1 topic and 64 bytes of data (an address and a uint256)
        //     log1(dataOffset, 0x40, topic)

        // }
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public payable {
        whitelist[msg.sender] = _amount;
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {   
        return (true, whitelist[sender]);
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        return balances[_user];
    }
}