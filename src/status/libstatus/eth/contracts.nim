import
  sequtils, sugar, macros, tables, strutils

import
  eth/common/eth_types, stew/byteutils, nimcrypto
from eth/common/utils import parseAddress

import
  ../types, ../settings, ../coder, transactions, methods

export
  GetPackData, PackData, BuyToken, ApproveAndCall, Transfer, BalanceOf, Register, SetPubkey,
  TokenOfOwnerByIndex, TokenPackId, TokenUri, FixedBytes, DynamicBytes, toHex, fromHex,
  decodeContractResponse, encodeAbi, estimateGas, send, call

type Contract* = ref object
  name*: string
  network*: Network
  address*: EthAddress
  methods*: Table[string, Method]

proc allContracts(): seq[Contract] = @[
  Contract(name: "snt", network: Network.Mainnet, address: parseAddress("0x744d70fdbe2ba4cf95131626614a1763df805b9e"),
    methods: [
      ("approveAndCall", Method(signature: "approveAndCall(address,uint256,bytes)")),
      ("transfer", Method(signature: "transfer(address,uint256)"))
    ].toTable
  ),
  Contract(name: "snt", network: Network.Testnet, address: parseAddress("0xc55cf4b03948d7ebc8b9e8bad92643703811d162"),
    methods: [
      ("approveAndCall", Method(signature: "approveAndCall(address,uint256,bytes)")),
      ("transfer", Method(signature: "transfer(address,uint256)"))
    ].toTable
  ),
  Contract(name: "tribute-to-talk", network: Network.Testnet, address: parseAddress("0xC61aa0287247a0398589a66fCD6146EC0F295432")),
  Contract(name: "stickers", network: Network.Mainnet, address: parseAddress("0x0577215622f43a39f4bc9640806dfea9b10d2a36"),
    methods: [
      ("packCount", Method(signature: "packCount()")),
      ("getPackData", Method(signature: "getPackData(uint256)"))
    ].toTable
  ),
  Contract(name: "stickers", network: Network.Testnet, address: parseAddress("0x8cc272396be7583c65bee82cd7b743c69a87287d"),
    methods: [
      ("packCount", Method(signature: "packCount()")),
      ("getPackData", Method(signature: "getPackData(uint256)"))
    ].toTable
  ),
  Contract(name: "sticker-market", network: Network.Mainnet, address: parseAddress("0x12824271339304d3a9f7e096e62a2a7e73b4a7e7"),
    methods: [
      ("buyToken", Method(signature: "buyToken(uint256,address,uint256)"))
    ].toTable
  ),
  Contract(name: "sticker-market", network: Network.Testnet, address: parseAddress("0x6CC7274aF9cE9572d22DFD8545Fb8c9C9Bcb48AD"),
    methods: [
      ("buyToken", Method(signature: "buyToken(uint256,address,uint256)"))
    ].toTable
  ),
  Contract(name: "sticker-pack", network: Network.Mainnet, address: parseAddress("0x110101156e8F0743948B2A61aFcf3994A8Fb172e"),
    methods: [
      ("balanceOf", Method(signature: "balanceOf(address)")),
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)")),
      ("tokenPackId", Method(signature: "tokenPackId(uint256)"))
    ].toTable
  ),
  Contract(name: "sticker-pack", network: Network.Testnet, address: parseAddress("0xf852198d0385c4b871e0b91804ecd47c6ba97351"),
    methods: [
      ("balanceOf", Method(signature: "balanceOf(address)")),
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)")),
      ("tokenPackId", Method(signature: "tokenPackId(uint256)"))
    ].toTable),
  # Strikers seems dead. Their website doesn't work anymore
  Contract(name: "strikers", network: Network.Mainnet, address: parseAddress("0xdcaad9fd9a74144d226dbf94ce6162ca9f09ed7e"),
    methods: [
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)"))
    ].toTable
  ),
  Contract(name: "ethermon", network: Network.Mainnet, address: parseAddress("0xb2c0782ae4a299f7358758b2d15da9bf29e1dd99"),
    methods: [
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)"))
    ].toTable
  ),
  Contract(name: "kudos", network: Network.Mainnet, address: parseAddress("0x2aea4add166ebf38b63d09a75de1a7b94aa24163"),
    methods: [
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)")),
      ("tokenURI", Method(signature: "tokenURI(uint256)"))
    ].toTable
  ),
  Contract(name: "kudos", network: Network.Testnet, address: parseAddress("0xcd520707fc68d153283d518b29ada466f9091ea8"),
    methods: [
      ("tokenOfOwnerByIndex", Method(signature: "tokenOfOwnerByIndex(address,uint256)")),
      ("tokenURI", Method(signature: "tokenURI(uint256)"))
    ].toTable
  ),
  Contract(name: "crypto-kitties", network: Network.Mainnet, address: parseAddress("0x06012c8cf97bead5deae237070f9587f8e7a266d")),
  Contract(name: "ens-usernames", network: Network.Mainnet, address: parseAddress("0xDB5ac1a559b02E12F29fC0eC0e37Be8E046DEF49"),
      methods: [
        ("register", Method(signature: "register(bytes32,address,bytes32,bytes32)")),
        ("getPrice", Method(signature: "getPrice()"))
      ].toTable
  ),
  Contract(name: "ens-usernames", network: Network.Testnet, address: parseAddress("0x11d9F481effd20D76cEE832559bd9Aca25405841"),
      methods: [
        ("register", Method(signature: "register(bytes32,address,bytes32,bytes32)")),
        ("getPrice", Method(signature: "getPrice()"))
      ].toTable
  ),
  Contract(name: "ens-resolver", network: Network.Mainnet, address: parseAddress("0x4976fb03C32e5B8cfe2b6cCB31c09Ba78EBaBa41"),
      methods: [
        ("setPubkey", Method(signature: "setPubkey(bytes32,bytes32,bytes32)"))
      ].toTable
  ),
  Contract(name: "ens-resolver", network: Network.Testnet, address: parseAddress("0x42D63ae25990889E35F215bC95884039Ba354115"),
      methods: [
        ("setPubkey", Method(signature: "setPubkey(bytes32,bytes32,bytes32)"))
      ].toTable
  ),
]

proc getContract(network: Network, name: string): Contract =
  let found = allContracts().filter(contract => contract.name == name and contract.network == network)
  result = if found.len > 0: found[0] else: nil

proc getContract*(name: string): Contract =
  let network = settings.getCurrentNetwork()
  getContract(network, name)
