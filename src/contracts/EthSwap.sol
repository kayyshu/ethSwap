pragma solidity ^0.5.0;

import "./Token.sol";


contract EthSwap {
  string public name = "EthSwap Instant Exchange";
  Token public token;
  uint public rate = 100;

  event TokenPurchased(
      address account,
      address token,
      uint amount,
      uint rate
  );
  event TokensSold(
      address account,
      address token,
      uint amount,
      uint rate
  );  

  constructor(Token _token) public{
    token = _token;
  }
    
  function buyTokens() public payable {

    uint tokenAmount = msg.value * rate;

    // Require that EthSwap has enough tokens
    require(token.balanceOf(address(this)) >= tokenAmount);

    // Transfer tokens to the user
    token.transfer(msg.sender, tokenAmount);

    emit TokenPurchased(msg.sender, address(token), tokenAmount, rate);
  }

  function sellTokens(uint _amount) public{
    //Calculate the amount of Ether to redeem
    uint etherAmount = _amount/ rate;

    //Perform sale
    token.transferFrom(msg.sender, address(this), _amount);
    msg.sender.transfer(etherAmount);

    //Emit an event
    emit TokensSold(msg.sender, address(token), _amount, rate);
  }
}