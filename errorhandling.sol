// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssertionContract {
    int public balance;

    function setValue(int _value) public {
        // Use require() to validate input conditions
        require(_value > 0, "Value must be greater than zero");

        // Use assert() to perform internal consistency checks
        assert(_value != 42);

        balance = _value;
    }

    function withdraw(int _amount) public {
        // Use require() to enforce certain conditions
        require(_amount <= balance, "Insufficient balance");

        // Perform the withdrawal logic
        balance -= _amount;

        // Use revert() to explicitly revert state changes
        if (balance == 0) {
            revert("Value reached zero"); // Revert and provide an error message
        }
    }
}
