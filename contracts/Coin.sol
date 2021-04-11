pragma solidity >=0.7.0 <=0.8.0;

contract Coin{
    address public owner;
    mapping (address=>uint) balancers;

    modifier onlyOwer(){
        require(msg.sender == ower,'Owable: call is not the onwer');
        _;
    }

    event Transfer(address _sender,address _receiver,uint _among);

    constructor(){
        owner = msg.sender;
    }

    function getBalance(address _address) public view returns (uint256) {
        return balancers[_address];
    }

    function mint(address _address, uint _amount) public onlyOwer{
        balancers[_address] +=_amount;
    }

    function transferAmongWithAddress(address _sender,address _receiver,uint _among) public{
        require(balancers[_sender]>= _among,'Dont enough money');
        balancers[_sender] -= _among;
        balancers[_receiver] += _among;
        emit Transfer(_sender,_receiver,_among);
    }



}