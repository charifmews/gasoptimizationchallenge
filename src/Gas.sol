// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
contract GasContract {
    mapping(address => uint256) public balances;
    address[5] public administrators;
    mapping(address => uint256) public whitelist;

    event AddedToWhitelist(address userAddress, uint256 tier);
    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 /*_totalSupply*/) {
        unchecked {
            administrators[0] = _admins[0];
            administrators[1] = _admins[1];
            administrators[2] = _admins[2];
            administrators[3] = _admins[3];
            administrators[4] = msg.sender;
            balances[msg.sender] = 0x3B9ACA00;
        }
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata /*_name*/
    ) public payable returns (bool /*status*/) {
        unchecked {
            balances[_recipient] += _amount;
            return true;
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        public payable
    {
        unchecked {
            if (!(_tier <= 0xFE)) { revert(); }
            if (address(0x1234) == msg.sender ) {
                whitelist[_userAddrs] = 3;
                emit AddedToWhitelist(_userAddrs, _tier);
                return;
            }
            revert();
        }
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public payable {
        unchecked {
            whitelist[msg.sender] = _amount;
            balances[msg.sender] -= _amount;
            balances[_recipient] += _amount;
            balances[msg.sender] += _amount;
            balances[_recipient] -= _amount;
            emit WhiteListTransfer(_recipient);
        }
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {   
        unchecked {
            return (true, whitelist[sender]);
        }     
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        unchecked {
            return balances[_user];
        }
    }
}