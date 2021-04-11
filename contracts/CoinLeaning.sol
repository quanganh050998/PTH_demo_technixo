// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.8.0;

contract CoinLending{
    struct Offer{
        uint amount;
        uint ltvRate;
        uint amountETH;
        uint duration;
        uint256 dailyInterestRate;
        address borrower;
        uint256 loanExpDate; // Ngày hết hạn vay
    }

    address public coincoinContractAddress;

    mapping (uint => Offer) public offer;
     constructor(address _coincoinContractAddress) {
        coincoinContractAddress = _coincoinContractAddress;
    }

    event OfferTaken(
        uint256 _id,
        address _borrower,
        uint256 _amountETH,
        uint256 _loanExpDate
    );

    function createOffer(
         uint256 _amount,
        uint256 _ltvRate,
        uint256 _duration,
        uint256 _dailyInterestRate
    ) public returns (uint){
        uint256 _id = offerId++;
        uint256 _amountETH = _amount / _ltvRate;

        offer[_id] = Offer({
            amount: _amount,
            ltvRate: _ltvRate,
            amountETH: _amountETH,
            duration: _duration,
            dailyInterestRate: _dailyInterestRate,
        });
        return id;
    }

    function borrow(uint _id) public payable{
        address _borrower= msg.sender;
        Offer storage myOffer= offer[_id];

        require(msg.value >= myOffer.amountETH, "You do not have enough ETH"); 

        myOffer.loanExpDate = block.timestamp + myOffer.duration;
        myOffer.borrower = _borrower;
        
        emit OfferTaken(_id, _borrower, msg.value, myOffer.loanExpDate);
    }


}