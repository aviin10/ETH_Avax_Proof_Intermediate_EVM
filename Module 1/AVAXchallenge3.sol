// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Counter {
    uint public count;

    // Define events with indexed parameters
    event Increase(address indexed sender, uint newValue);
    event Decrease(address indexed sender, uint newValue);
    event Reset(address indexed sender, uint oldValue);

    // Increment the counter and emit an event
    function increase() public {
        count += 1;
        emit Increase(msg.sender, count);
    }

    // Decrement the counter and emit an event
    function decrease() public {
        require(count > 0, "Counter: cannot decrease below zero");
        count -= 1;
        emit Decrease(msg.sender, count);
    }

    // Reset the counter and emit an event
    function reset() public {
        uint oldValue = count;
        count = 0;
        emit Reset(msg.sender, oldValue);
    }
}
