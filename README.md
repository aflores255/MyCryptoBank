# 🏦 MyCryptoBank Smart Contract

## 📝 **Overview**
The **MyCryptoBank Smart Contract** is a blockchain-based application designed to facilitate secure deposits and withdrawals of Ether. Built with **Solidity**, this contract enables multiple users to manage their balances while ensuring security through an admin-controlled maximum deposit limit and pause functionality.

This contract was developed and tested using **Remix IDE**.

---

## 🚀 **Features**

| **Feature**                        | **Description**                                                                                         |
|------------------------------------|---------------------------------------------------------------------------------------------------------|
| 💰 **Deposit & Withdraw Ether**    | Users can deposit and withdraw Ether while adhering to their available balance.                        |
| 🔐 **Maximum Deposit Limit**       | Each user has a predefined deposit limit enforced by the contract.                                     |
| 🛑 **Pause Functionality**         | The admin can pause and resume deposits/withdrawals for security or maintenance reasons.               |
| 📊 **Bank Balance Visibility**      | Users and the admin can check the total balance held in the contract.                                  |
| 📝 **Event Logging**               | Emits events for deposits, withdrawals, and contract status changes to enhance traceability.           |

---

## 📜 **Smart Contract Details**

### ⚙️ **Modifiers**
Modifiers enforce specific rules before allowing a function to execute.

| **Modifier**        | **Description**                                                |
|---------------------|----------------------------------------------------------------|
| **`onlyAdmin`**    | Ensures that only the admin can execute certain functions.    |
| **`NotPaused`**    | Prevents execution of deposit and withdrawal functions when paused. |

---

### 📡 **Events**

| **Event**             | **Description**                                                    |
|----------------------|----------------------------------------------------------------|
| **`DepositEth`**    | Triggered when a user deposits Ether into the contract.        |
| **`WithdrawEth`**   | Triggered when a user withdraws Ether from the contract.       |
| **`PauseStatus`**   | Triggered when the contract's pause status is modified.        |

---

### 💻 **Contract Functions**

#### **Core Functions**

| **Function**                   | **Description**                                                               |
|--------------------------------|-------------------------------------------------------------------------------|
| **`deposit()`**                | Allows users to deposit Ether into their account, respecting max balance.    |
| **`withdraw(amount_)`**        | Allows users to withdraw Ether up to their available balance.                 |

#### **Admin Functions**

| **Function**                   | **Description**                                                               |
|--------------------------------|-------------------------------------------------------------------------------|
| **`modifyBalance(newMaxBalance_)`** | Allows the admin to modify the maximum deposit limit per user.         |
| **`pauseContract(contractPaused_)`** | Allows the admin to pause or unpause the contract.                     |

#### **Utility Functions**

| **Function**                  | **Description**                                                       |
|--------------------------------|-----------------------------------------------------------------------|
| **`getBankBalance()`**        | Returns the total balance of Ether held in the contract.             |
| **`getMyAvailableBalance()`** | Allows a user to check their current available balance.              |

---

## 🛠️ **How to Use**

### 🔧 **Prerequisites**
- **Remix IDE**: You can access it at [Remix Ethereum](https://remix.ethereum.org).
- A basic understanding of Ethereum transactions and wallet addresses is helpful.

---

### 🚀 **Deployment Steps**

1. Open **Remix IDE** and create a new file (e.g., `MyCryptoBank.sol`).
2. Paste the smart contract code into the file.
3. Compile the contract using Solidity version **0.8.26**.
4. Deploy the contract with the following arguments:
   - **`maxBalance_`**: Maximum balance a user can deposit.
   - **`admin_`**: Address of the contract administrator.

---

### 🖱️ **Interacting with the Contract**

#### **For Users:**
- Use the **`deposit()`** function to deposit Ether into your account.
- Use the **`withdraw(amount_)`** function to withdraw available funds.
- Use **`getMyAvailableBalance()`** to check your balance.

#### **For the Admin:**
- Use **`modifyBalance(newMaxBalance_)`** to update the maximum deposit limit per user.
- Use **`pauseContract(contractPaused_)`** to pause or resume contract operations.
- Use **`getBankBalance()`** to check the total funds held in the contract.

---

## 📄 **License**
This project is licensed under the **LGPL-3.0-only**.
