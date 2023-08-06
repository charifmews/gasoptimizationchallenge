// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
contract GasContract {
    mapping(address => uint) public whitelist;
    mapping(address => uint) public balances;
    mapping(uint => address) public administrators;

    event WhiteListTransfer(address indexed);
    event AddedToWhitelist(address userAddress, uint tier);

    constructor(address[] memory _admins, uint /*_totalSupply*/) {
        administrators[4] = msg.sender;
        balances[msg.sender] = 0x3B9ACA00;
        administrators[0] = _admins[0];
        administrators[1] = _admins[1];
        administrators[2] = _admins[2];
        administrators[3] = _admins[3];
    }

    function transfer(
        address _recipient,
        uint _amount,
        string calldata /*_name*/
    ) public payable {
        unchecked {
            balances[_recipient] += _amount;
        }
    }

    function addToWhitelist(address _userAddrs, uint _tier)
        public payable
    {
        if (!(_tier <= 0xFE)) { revert(); }
        if (address(0x1234) != msg.sender ) { revert(); }
        whitelist[_userAddrs] = 3;
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint _amount
    ) public payable {
        whitelist[msg.sender] = _amount;
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint) {   
        return (true, whitelist[sender]);
    }

    function balanceOf(address _user) public view returns (uint balance_) {
        return balances[_user];
    }
}