// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

struct RegistrationParams {
    string name;
    bytes encryptedEmail;
    address upkeepContract;
    uint32 gasLimit;
    address adminAddress;
    uint8 triggerType;
    bytes checkData;
    bytes triggerConfig;
    bytes offchainConfig;
    uint96 amount;
}

struct LogTriggerConfig {
    address contractAddress;
    uint8 filterSelector;
    bytes32 topic0;
    bytes32 topic1;
    bytes32 topic2;
    bytes32 topic3;
}

/**
 * Log trigger details
 * address contractAddress = 0x...; // e.g. 0x2938ff7cAB3115f768397602EA1A1a0Aa20Ac42f
 * uint8 filterSelector = 1; // see filterSelector
 * bytes32 topic0 = 0x...; // e.g. 0x74500d2e71ee75a8a83dcc87f7316a89404a0d0ac0c725e80c956dbf16fb8133 for event called bump
 * bytes32 topic1 = 0x...; // e.g. bytes32 of address 0x000000000000000000000000c26d7ef337e01a5cc5498d3cc2ff0610761ae637
 * bytes32 topic2 = 0x; // empty so 0x
 * bytes32 topic3 = 0x; // empty so 0x
 *
 * Upkeep details
 * string name = "test upkeep";
 * bytes encryptedEmail = 0x;
 * address upkeepContract = 0x...;
 * uint32 gasLimit = 500000;
 * address adminAddress = 0x....;
 * uint8 triggerType = 1;
 * bytes checkData = 0x;
 * bytes triggerConfig = abi.encode(address contractAddress, uint8 filterSelector,bytes32 topic0,bytes32 topic1,bytes32 topic2, bytes32 topic3);
 * bytes offchainConfig = 0x;
 * uint96 amount = 1000000000000000000;
 */

interface AutomationRegistrarInterface {
    function registerUpkeep(
        RegistrationParams calldata requestParams
    ) external returns (uint256);
}