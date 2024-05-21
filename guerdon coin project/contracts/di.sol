pragma solidity ^0.8.0;

contract CreditSystem {
    address public person1;
    address public person2;
    int public person1Credits=100;
    int public person2Credits=50;
        
mapping(string => bool) _documents;

    modifier onlyAuthorized() {
        require(msg.sender == person1 || msg.sender == person2, "You are not authorized to perform this action.");
        _;
    }
    public constructor()returns(uint){
        person1 = msg.sender;
        person2 = 0x467ff262fDFEd564B998Cc320b8C92c468887097;
        // Replace with the address of person 2
    }
   
   
    function work() public onlyAuthorized {
        if (msg.sender == person1) {
            person1Credits += 10;
            person2Credits -= 10;
        } else if (msg.sender == person2) {
            person1Credits -= 10;
            person2Credits += 10;
        }
    }
   
    function notWork() public onlyAuthorized {
        if (msg.sender == person1) {
            person1Credits -= 10;
            person2Credits += 10;
        } else if (msg.sender == person2) {
            person1Credits += 10;
            person2Credits -= 10;
        }
    }
   
    function getPerson1Credits() public view returns (int) {
        return person1Credits;
    }
   
    function getPerson2Credits() public view returns (int) {
        return person2Credits;
    }

function uploadCertificate(address user, string memory documentHash) public onlyAuthorized {
        require(msg.sender == person1 || msg.sender == person2, "You are not authorized to upload certificates.");
        require(!_documents[documentHash], "Already uploaded certificate");

if (user == person1) {
            person1Credits += 15;
        } else if (user == person2) {
            person2Credits += 15;
        }
        _documents[documentHash] = true;
    }
}