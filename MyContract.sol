pragma solidity ^0.8.10;

contract MyContract{
    string value;

    constructor() public {
        value = "myValue";
    }
/*Explicit data location for all variables of struct, array or mapping types is now mandatory. 
This is also applied to function parameters and return variables
*/

    function get() public view returns(string memory){
        return value;
    }

    function set(string memory _value) public{
        value = _value;
    }
}