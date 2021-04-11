pragma solidity >=0.7.0 <=0.8.0;

contract Coin{
    address public owner;
    mapping (address=>uint256) balancers;

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }

    event Transfer(address _sender,address _receiver,uint _among);

    constructor(){
        owner = msg.sender;
    }

    function getBalance(address _address) public view returns (uint256) {
        return balancers[_address];
    }

    function mint(address _address, uint _amount) public onlyOwner{
        balancers[_address] +=_amount;
    }

    function transferAmongWithAddress(address _sender,address _receiver,uint _among) public{
        require(balancers[_sender]>= _among,'Dont enough money');
        balancers[_sender] -= _among;
        balancers[_receiver] += _among;
        emit Transfer(_sender,_receiver,_among);
    }



}