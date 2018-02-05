contract SHCN is Token{

  function someFunction() {
    throw;
  }

  string public name;
  uint8 public decimals;
  string public symbol;

  function SHCN(){
      balances[msg.sender] = 1000;
      totalSupply = 1000;
      name = "Shitcoin";
      decimals = 0;
      symbol = "SHCN";
    }

  function approvaAndCall(address _spender, uint 256 _value, bytes _extraData) returns (bool success){
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender,_spender,_value);

    if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value,this,_extraData)){ throw; }
  }
}
