# NFTs 👻

## About
In this project, I create my own NFTs using the ERC-721 token standard, minted them and finally got them to show up in my Metamask wallet!
### Two types of NFT:
1. **Static NFT**: This NFT will not change based on any action. 
   
`Note: The NFT is stored on IPFS, hence not 100% decentralised. The Token URI is mentioned below.`
>NFT Name: Dogie <br />
>NFT Symbol: DOG <br />

[Link to Dogie NFT contract on Etherscan](https://sepolia.etherscan.io/address/0xc3fbA630Ca69Ef9b509425227008883A5EA99d09)

1. **Dynamic NFT**: This NFT has the capability to change using a function call, hence it's dynamic. Isn't that cool!!😎
   
`Note: This NFT is stored 100% on chain!`

>NFT Name: Mood NFT <br />
>NFT Symbol: MN <br />

[Link to Mood NFT contract on Etherscan](https://sepolia.etherscan.io/address/0xb2076264cc4af2eef51e325e33afeddf0e5d6e84)


## Usage
### OpenZeppelin

[OpenZeppelin Contracts Docs](https://docs.openzeppelin.com/contracts/4.x/)
<br><br>
[OpenZeppelin GitHub Repo](https://github.com/OpenZeppelin/openzeppelin-contracts)
<br>

### Installing OpenZeppelin Contracts Package

```bash
forge install OpenZeppelin/openzeppelin-contracts --no-commit
```


## Quickstart 🚀

```
git clone https://github.com/alfheimrShiven/nft.git
cd nft
forge build
```

## Testing
`forge test`

or

`forge test --fork-url $SEPOLIA_RPC_URL`

#### Test coverage
`forge coverage`

## Deploying Dogie NFT

### Start a local node

```
make anvil
```

### Deploy on local ANVIL chain ⛓️
```
make deployBasicNft
```
### Deploy on Sepolia test net ⛓️
1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

2. Deploy

```
make deployBasicNft ARGS="--network sepolia"
```

## Now it's time to MINT your Dogie NFT 🐶
```
make mintBasicNft
```

## Deploying Mood NFT
### Start a local node

```
make anvil
```

### Deploy on local ANVIL chain ⛓️
```
make deployMoodNft
```
### Deploy on Sepolia test net ⛓️
1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

2. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

3. Deploy

```
make deployMoodNft ARGS="--network sepolia"
```

## Now it's time to MINT your Mood NFT 🎁
```
make mintMoodNft
```

## Flip mood
```
make flipMoodNft
```

## Importing your NFTs into Metamask
Once minted, import your NFT into your Metamask. Since you would be the first one minting the NFT, `Token ID = 0`. To learn how to import, [refer this blog.](https://intercom.help/swappable/en/articles/5603343-how-do-i-see-an-nft-in-my-metamask-wallet)



# Thank you! 🤗

If you appreciated this, feel free to follow me:

[![Shivens LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shivends/)

[![Shivens Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/shiven_alfheimr)
