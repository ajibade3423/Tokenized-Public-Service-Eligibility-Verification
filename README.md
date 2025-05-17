# Tokenized Public Service Eligibility Verification System

A blockchain-based system for managing public service eligibility verification using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a secure, transparent, and efficient way to verify eligibility for public services using tokenization. By leveraging blockchain technology, it ensures that public services are allocated fairly and transparently while maintaining an immutable audit trail.

## Key Features

- **Citizen Identity Management**: Secure storage and verification of citizen identities
- **Eligibility Criteria Management**: Define and update service eligibility requirements
- **Document Verification**: Validate and track supporting documentation
- **Benefit Allocation**: Tokenized allocation of public services
- **Audit Trail**: Immutable record of all service allocations and usage

## Smart Contracts

### 1. Citizen Identity Contract (`citizen-identity.clar`)
Manages resident information and identity verification:
- Register citizens with essential information
- Issue non-fungible tokens representing verified identities
- Verify citizen identities
- Query citizen information

### 2. Eligibility Criteria Contract (`eligibility-criteria.clar`)
Records service requirements:
- Define public services and their eligibility criteria
- Specify required documentation for each service
- Update service requirements as needed
- Query service eligibility rules

### 3. Documentation Verification Contract (`documentation-verification.clar`)
Validates supporting materials:
- Define document types needed for verification
- Submit and verify citizen documents
- Track document validity and expiration
- Check document verification status

### 4. Benefit Allocation Contract (`benefit-allocation.clar`)
Manages service distribution:
- Allocate benefits to eligible citizens
- Issue tokens representing benefit allocations
- Track service usage and benefit distribution
- Deactivate benefits when necessary

### 5. Audit Trail Contract (`audit-trail.clar`)
Records benefit provision history:
- Log all benefit allocations and usage
- Provide transparent access to audit information
- Maintain immutable records of all system actions
- Support accountability and transparency

## Setup and Deployment

### Prerequisites
- [Clarity](https://clarity-lang.org/) development environment
- Stacks blockchain node (for deployment)

### Local Development
1. Clone this repository
2. Use the Clarity CLI to check and test contracts:
   \`\`\`
   clarity-cli check citizen-identity.clar
   clarity-cli test tests/citizen-identity.test.ts
   \`\`\`

### Deployment
1. Deploy contracts to the Stacks blockchain in this order:
    - Citizen Identity Contract
    - Eligibility Criteria Contract
    - Documentation Verification Contract
    - Audit Trail Contract
    - Benefit Allocation Contract
2. Update contract references in each contract to match deployed contract addresses

## Usage

### For Administrators
- Register and verify citizen identities
- Define public services and eligibility criteria
- Verify submitted documentation
- Allocate benefits to eligible citizens
- Query audit logs for transparency

### For Citizens
- Register and obtain identity verification
- Submit required documentation
- Check eligibility for various services
- Receive tokenized benefits
- Track benefit usage and history

## Testing

Run tests using Vitest:

\`\`\`bash
npm test
\`\`\`

## Security Considerations

- Citizen data is stored securely with appropriate access controls
- Only authorized administrators can register and verify citizens
- Document verification includes expiration checks
- Benefit allocation requires identity and eligibility verification
- All actions are recorded in an immutable audit trail

## License

[MIT License](LICENSE)
