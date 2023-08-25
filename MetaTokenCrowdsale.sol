pragma solidity ^0.5.0;

import "./MetaTokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract MetaTokenCrowdsale is Crowdsale, MintedCrowdsale {
    constructor(
        uint256 rate, // rate in TKNbits - uint256 and uint are interchangeable - https://docs.soliditylang.org/en/v0.4.21/types.html#value-types
        address payable wallet, // sale beneficiary
        MetaToken token // the MetaToken itself that the MetaTokenCrowdsale will work with
    )
      Crowdsale(rate, wallet, token)
      public {}
}

contract MetaTokenCrowdsaleDeployer {
    address public meta_token_address;
    address public meta_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    ) public {
        // create the MetaToken and keep its address handy
        MetaToken token = new MetaToken(name, symbol);
        meta_token_address = address(token);

        // create the MetaTokenCrowdsale and tell it about the token
        MetaTokenCrowdsale meta_crowdsale =
            new MetaTokenCrowdsale(1, wallet, token);
        meta_crowdsale_address = address(meta_crowdsale);

        // make the MetaTokenCrowdsale contract a minter,
        // then have the MetaTokenCrowdsaleDeployer renounce its minter role
        token.addMinter(meta_crowdsale_address);
        token.renounceMinter();
    }
}
