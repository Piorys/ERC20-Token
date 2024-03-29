// An ERC20 Standard Token compliant with Ethereum blockchain network
// Made by Piorys
// 05.02.2018

pragma solidity ^0.4.4;

contract ERC20Token{

  function totalSupply() constant returns (uint256 supply) {}
  function balanceOf(address _owner) constant returns (uint256 balance) {}
  function transfer(address _to, uint256 _value) returns (bool success) {}
  function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}
  function approve(address _owner, address _spender) constant returns (bool success) {}
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

  event Transfer(address indexed _from, address indexed _to, uint256  _value);
  event Approval(address indexed _owner, address _spender, uint256 _value);

}

contract Token is ERC20Token {
  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  uint256 public totalSupply;

  function transfer(address _to,uint  _value) returns (bool success){
    if(balances[msg.sender] >= _value && _value > 0){
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      Transfer(msg.sender,_to,_value);
      return true;
  }else{
    return false;
  }
  }

  function transferFrom(address _from, address _To, uint256 _value) returns (bool success){
    if(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value >0){
      balances[_to] += _value;
      balances[_from] -= _value;
      allowed[_from][msg.sender] -= _value;
      Transfer(_from, _to, _value);
      return true;
    }else{
      return false;
    }
  }

  function balanceOf(address _owner) cosntant returns (uint256 balance){
    return balances[_owner];
  }

  function approve(address _spender, uint256 _value) returns (bool success){
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender,_spender,_value);
    return true;
  }

  function allowance(address _owner,address _spender) constant returns (uint256 remaining) {
    return allowed[_owner][_spender];    
  }


}
