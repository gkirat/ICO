// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ERC20Interface{
        function totalSupply() external view returns (uint256);
        function balanceOf(address tokenowner) external view returns (uint256 balance);
        function transfer(address to, uint256 token) external returns (bool success);
        function transferFrom(address from, address to, uint256 tokens) external returns (bool success);
        function approve(address spender, uint256 token) external returns (bool success);
        function allowance(address tokenowner, address spender) external view returns (uint256 remaining);


        event Transfer(address indexed from, address indexed to, uint256 tokens);
        event Approval(address indexed owner, address indexed spender, uint256 token);

}

contract Block is ERC20Interface{
    string public name="block";
    string public symbol="Blk";

    uint public decimal=0;
    uint public override totalSupply;
    address public founder;
    mapping(address=>uint) public balance;
    mapping(address=>mapping(address=>uint)) allowed;

    constructor(){
        totalSupply=10000000;
        founder=msg.sender;
        balance[founder]=totalSupply;
    }

    function balanceOf(address tokenowner) public override view returns (uint )   {
        return balance[tokenowner];
    }

    function transfer(address to, uint256 tokens) public  virtual override returns (bool success ){
        require(balance[msg.sender]>=tokens,"token required for transaction");
        balance[to]+=tokens;
        balance[msg.sender]-=tokens;
        emit Transfer(msg.sender,to,tokens);
        return true;
    }

    function approve(address spender, uint256 tokens) public  override returns (bool success){
        require(balance[msg.sender]>=tokens);
        require(tokens>0);
        allowed[msg.sender][spender]=tokens;
        emit Approval(msg.sender,spender,tokens);
        return (true);
    }

    function allowance(address tokenowner, address spender) public override view returns (uint256 remaining){
        return allowed[tokenowner][spender];
    }

    function transferFrom(address from, address to, uint256 tokens) public  virtual override  returns (bool success){
        require(allowed[from][to]>=tokens);
        require(balance[from]>=tokens);
        balance[to]+=tokens;
        balance[from]-=tokens;
        return true;
    }
}

contract ICO is Block{

    address public manager;
    address payable public deposit;


    uint public tokenprice=0.1 ether;
    uint public cap=300 ether;

    uint public raisedamount;

    uint public icostart=block.timestamp;
    uint public icoend=block.timestamp + 3600;   //in seconds

    uint public tokentradetime=icoend +3600;

    uint public mininvest=0.1 ether;
    uint public maxinvest=10 ether;

    enum State{
        beforestart,
        afterend,
        running,
        halted
    }

    State public icostate;

    event Invest(address investor,uint value,uint tokens);

    constructor(address payable _deposit){
        deposit=_deposit;
        manager=msg.sender;
        icostate=State.beforestart;

    }
    modifier onlymanager(){
        require(msg.sender==manager,"you are not the manager");
        _;
    }
        
    function halt()public onlymanager{
        icostate=State.halted;
    }

    function resume()public onlymanager{
        icostate=State.running;
    }
// This function below is made if our gets hacked so as a safety feature we don't want the investors to suffer any loss
    function changedepositaddress(address payable newdeposit)public onlymanager{
        deposit=newdeposit;
    }

    function getstate()public view returns(State){
        if (icostate==State.halted){
            return State.halted;
        }
        else if(block.timestamp>=icostart && block.timestamp <=icoend){
            return State.running;
        }
        else if (block.timestamp<icostart){
            return State.beforestart;
        }
        else if(block.timestamp>icoend){
            return State.afterend;
        }
    }

    function invest()public payable returns(bool){
        icostate=getstate();
        require(icostate==State.running);
        require(msg.value >=mininvest && msg.value<=maxinvest);

        raisedamount+=msg.value;
        require(raisedamount<=cap);
        uint tokens=msg.value/tokenprice;  // this is used to set the value of the token

        balance[msg.sender]+=tokens;
        balance[founder]-=tokens;
        deposit.transfer(msg.value);
        emit Invest(msg.sender,msg.value,tokens);
        return true;
    }

    function burn()public returns(bool){
        icostate =getstate();
        require(icostate==State.afterend);
        balance[founder]=0;  //to increase demand by cutting down the supplies

    }

    function transfer(address to ,uint tokens) public override returns(bool success){
        require(block.timestamp>tokentradetime);
        super.transfer(to,tokens); //we can also write Block instead of super to call to the function present in parent contract
        // Block.transfer(to,tokens);
    return true;  
    }

    function transferFrom(address from,address to,uint tokens)public override returns(bool success){
        require(block.timestamp>tokentradetime);
        Block.transferFrom(from,to,tokens);
        return true;

    }
// Below fucntion is used if the investor doesn't know there is invest function and if transfers externally directly to the contract then thos is helpful
    receive() external payable{
        invest();
    }



}
