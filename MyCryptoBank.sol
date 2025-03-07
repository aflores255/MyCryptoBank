//Licence
//SPDX-License-Identifier: LGPL-3.0-only

//Solidity

pragma solidity 0.8.26;

// Contract

/* - Allow deposit and withdraw of ether only
   - Cryptobank could have multiuser
   - There is a maximum balance to be deposited in total by any user
   - User can only withdraw up to their available balance. 

*/

contract MyCryptoBank{

    // Variables

    uint256 public maxBalance;
    address public admin;
    mapping(address=>uint256) public userBalance;
    bool public contractPaused;

    //Modifiers

    modifier onlyAdmin() {
        require(msg.sender==admin,"Unauthorized");
        _;
    }

    modifier NotPaused(){
        require(contractPaused == false,"Contract is paused");
        _;
    }

    //Events

    event DepositEth(address user_, uint256 amount_);
    event WithdrawEth(address user_,uint256 amount_);
    event PauseStatus(bool paused);

    // Constructor

    constructor(uint256 maxBalance_, address admin_){

        maxBalance = maxBalance_;
        admin = admin_;
        contractPaused = false;

    }

    // Functions

    // Deposit Ether

    function deposit() external payable NotPaused{
        require(userBalance[msg.sender] + msg.value <= maxBalance,"");
        userBalance[msg.sender] += msg.value; // assign deposit value to user address
        emit DepositEth(msg.sender, msg.value);

    }

    // Withdraw Ether

    function withdraw(uint256 amount_) external NotPaused{

        require(amount_ <= userBalance[msg.sender],"Cannot withdraw more than available balance");
        //update user balance
        userBalance[msg.sender]-=amount_;
        // transfer from SC to user
        (bool success,) = msg.sender.call{value:amount_}("");

        require(success, "Withdraw failed");

        emit WithdrawEth(msg.sender, amount_);


    }

    // Modify maxBalance

    function modifyMaxBalance(uint256 newMaxBalance_) external onlyAdmin{

        maxBalance = newMaxBalance_;
    }

     // Modify contractPaused

    function pauseContract(bool contractPaused_) external onlyAdmin{

        contractPaused = contractPaused_;
        emit PauseStatus(contractPaused_);
    }

    // Check bank balance

    function getBankBalance() external view returns (uint256) {

        return address(this).balance;

    }   

    // Check sender balance

    function getMyAvailableBalance() external view returns (uint256) {
        return userBalance[msg.sender];
    }



}