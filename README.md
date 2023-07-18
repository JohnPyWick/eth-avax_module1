## Error Handling

## Description
In this example, the AssertionContract demonstrates the usage of require(), assert(), and revert() statements.
These statements (require(), assert(), and revert()) are essential in smart contracts to enforce conditions, validate inputs, and handle unexpected scenarios. Each statement serves a different purpose and can help improve the security and reliability of the contract.
### Code
```javascript
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
```

### Require()
Using require() to validate that the input amount is greater than zero. If the condition is not met, it will revert the transaction and provide an error message.

```javascript
function deposit(int _amount) public {
        // Use require() to check if the amount is greater than zero
        require(_amount > 0, "Balance must be greater than zero");
        
        // Increase the balance by the amount entered
        balance += _amount;
    }
```
### Assert()
Additionally, the assert() statement checks that balance is greater than the amount being withdrawn. If the condition is false, it will trigger an internal inconsistency and cause the transaction to revert.

```javascript
function withdraw(int _amount) public {
        // Using asseert to check if balance is less than the amount being withdrawn
        assert(_amount <= balance);

        // Reduce the balance by the amount entered
        balance -= _amount;

```

### Revert
Revert() in the function checks if the amount withdrawn will make the balance zero if it does it won't allow it and revert the changes.

```javascript
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

```
### Revert Explained
After performing the withdrawal logic, the function checks if the contract's value has reached zero. If it has, the revert() statement is used to explicitly revert the state changes made within the function. The revert function call can include an error message to provide more information about why the state changes were reverted.

```javascript
// Using revert() to explicitly revert state changes is the balance is zero and user tries to withdraw
        if (balance == 0) {
            revert("Balance is zero can't withdraw"); // Revert and provide an error message
        }
```

## Authors

- [@JohnPyWick](https://github.com/JohnPyWick)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details


