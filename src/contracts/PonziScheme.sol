pragma solidity  >= 0.6.0;


contract PonziScheme {
    // Contract for Solidity Ponzi Scheme
    uint public constant MIN_INVESTMENT = 1e18;
    mapping(address => uint) public balances;
    address[] public investors;

    event Deposit(
        address indexed _from,
        uint256 _value
    );
    
    constructor() public {
        investors.push(msg.sender);
    }
    
    
    receive() external payable {


    }

    function deposit() payable public
    {
        require(msg.value >= MIN_INVESTMENT, "Not minimum investment");

        // Distribute the rewards between all investors
            uint rewardForInvestor  = msg.value / investors.length;
            for(uint i=0;i<investors.length;i++){
                balances[investors[i]] += rewardForInvestor;
            }
            investors.push(msg.sender);
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw() public payable{
        
        uint payout = balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.transfer(payout);

    }

    function balanceOf() public view returns(uint){
        return balances[msg.sender];
    }


    function showInvestors() public view returns(address[] memory){
        return investors;
    }


}