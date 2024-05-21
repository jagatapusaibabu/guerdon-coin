pragma solidity >0.4.0 <0.9.0;
// SPDX-License-Identifier: MIT
contract CarbonCreditSystem {
    address public owner;
    
    struct Company {
        string name;
        uint256 credits;
    }
    
    Company[] public companies;

    constructor() {
        owner = msg.sender;
        companies.push(Company("Company1", 20000));
        companies.push(Company("Company2", 30000));
        companies.push(Company("Company3", 40000));
    }

    function getCompanyCount() public view returns (uint256) {
        return companies.length;
    }

    function getCredits(uint256 index) public view returns (string memory, uint256) {
        require(index < companies.length, "Invalid index");
        return (companies[index].name, companies[index].credits);
    }

    function transferCredits(uint256 fromIndex, uint256 toIndex, uint256 amount) public {
        require(fromIndex < companies.length && toIndex < companies.length, "Invalid index");
        require(fromIndex != toIndex, "Cannot transfer to the same company");
        require(companies[fromIndex].credits >= amount, "Insufficient credits");
        
        companies[fromIndex].credits -= amount;
        companies[toIndex].credits += amount;
    }
}