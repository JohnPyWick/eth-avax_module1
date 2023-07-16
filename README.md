## Error Handling

## Description
In this example, the AssertionContract demonstrates the usage of require(), assert(), and revert() statements.
These statements (require(), assert(), and revert()) are essential in smart contracts to enforce conditions, validate inputs, and handle unexpected scenarios. Each statement serves a different purpose and can help improve the security and reliability of the contract.
### Code
```javascript
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
```

### SetValue Function
The setValue() function uses require() to validate that the input value is greater than zero. If the condition is not met, it will revert the transaction and provide an error message.

```javascript
function setValue(int _value) public {
        // Use require() to validate input conditions
        require(_value > 0, "Value must be greater than zero");

        // Use assert() to perform internal consistency checks
        assert(_value != 42);

        balance = _value;
    }
```

Additionally, the assert() statement checks that the input value is not equal to 42. If the condition is false, it will trigger an internal inconsistency and cause the transaction to revert.

```javascript
assert(_value != 42);
```

### Withdraw Function
The withdraw() function uses require() to enforce the condition that the withdrawal amount should be less than or equal to the current value. If the condition fails, the transaction will revert with an error message.

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
// Use revert() to explicitly revert state changes
        if (balance == 0) {
            revert("Value reached zero"); // Revert and provide an error message
        }
```

## Authors

- [@JohnPyWick](https://github.com/JohnPyWick)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details


