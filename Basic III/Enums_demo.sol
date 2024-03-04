// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumsDemo {
    enum State { Pending, Active, Inactive }

    State public state;

    function setState(uint8 _state) external {
        require(_state <= uint8(State.Inactive), "Invalid state");
        state = State(_state);
    }

    function getState() external view returns (uint8) {
        return uint8(state);
    }
}
