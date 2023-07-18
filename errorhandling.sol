// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    int public balance;

    function deposit(int _amount) public {
        // Use require() to check if the amount is greater than zero
        require(_amount > 0, "Balance must be greater than zero");
        
        // Increase the balance by the amount entered
        balance += _amount;
    }

    function withdraw(int _amount) public {
        // Using asseert to check if balance is less than the amount being withdrawn
        assert(_amount <= balance);

        // Reduce the balance by the amount entered
        balance -= _amount;

        // Using revert() to explicitly revert state changes is the balance is zero and user tries to withdraw
        if (balance == 0) {
            revert("Balance is zero can't withdraw"); // Revert and provide an error message
        }
    }

}
