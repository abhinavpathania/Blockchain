// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegreeVerification {
    struct Degree {
        string firstName;
        string lastName;
        string rollNumber;
        string gender;
        string course;
        string email;
        string year;
        string graduationYear;
        string gpa;
        bool exists;
    }

    mapping(bytes32 => Degree) private degrees;
    address public admin;
    mapping(address => bool) public verifiers;

    event DegreeAdded(bytes32 indexed degreeHash, string firstName, string lastName, string rollNumber);
    event VerifierAdded(address indexed verifier);
    event VerifierRemoved(address indexed verifier);

    constructor() {
        admin = msg.sender;
    }
    
    function isAddressAdmin(address _addr) public view returns (bool) {
    return _addr == admin;
}

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier onlyVerifier() {
        require(verifiers[msg.sender] || msg.sender == admin, "Only verifier or admin can perform this action");
        _;
    }

    function addVerifier(address _verifier) public onlyAdmin {
        verifiers[_verifier] = true;
        emit VerifierAdded(_verifier);
    }

    function removeVerifier(address _verifier) public onlyAdmin {
        verifiers[_verifier] = false;
        emit VerifierRemoved(_verifier);
    }

    function addDegree(
        string memory _firstName,
        string memory _lastName,
        string memory _rollNumber,
        string memory _gender,
        string memory _course,
        string memory _email,
        string memory _year,
        string memory _graduationYear,
        string memory _gpa,
        bytes32 _hexCode
    ) public onlyAdmin {
        require(!degrees[_hexCode].exists, "Degree already exists");

        degrees[_hexCode] = Degree(
            _firstName,
            _lastName,
            _rollNumber,
            _gender,
            _course,
            _email,
            _year,
            _graduationYear,
            _gpa,
            true
        );
        emit DegreeAdded(_hexCode, _firstName, _lastName, _rollNumber);
    }

    function verifyDegree(bytes32 _hexCode) public view onlyVerifier returns (bool, Degree memory) {
        return (degrees[_hexCode].exists, degrees[_hexCode]);
    }

    
}

