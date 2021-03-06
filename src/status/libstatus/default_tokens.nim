import json
import settings
import types

proc getDefaultTokens*(): JsonNode =
  if getCurrentNetwork() == Network.Testnet:
    return %* [
      {
        "symbol": "STT",
        "name": "Status Test Token",
        "address": "0xc55cf4b03948d7ebc8b9e8bad92643703811d162",
        "decimals": 18,
        "hasIcon": true
      }
    ]

  if getCurrentNetwork() == Network.Mainnet:
    return %* [
      {
        "symbol": "DAI",
        "name": "Dai Stablecoin",
        "address": "0x6b175474e89094c44da98b954eedeac495271d0f",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SAI",
        "name": "Sai Stablecoin v1.0",
        "address": "0x89d24a6b4ccb1b6faa2625fe562bdd9a23260359",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "MKR",
        "name": "MKR",
        "address": "0x9f8f72aa9304c8b593d555f12ef6589cc3a579a2",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "EOS",
        "name": "EOS",
        "address": "0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "OMG",
        "name": "OMGToken",
        "address": "0xd26114cd6ee289accf82350c8d8487fedb8a0c07",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "PPT",
        "name": "Populous Platform",
        "address": "0xd4fa1460f537bb9085d22c7bccb5dd450ef28e3a",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "REP",
        "name": "Reputation",
        "address": "0x1985365e9f78359a9b6ad760e32412f4a445e862",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "POWR",
        "name": "PowerLedger",
        "address": "0x595832f8fc6bf59c85c527fec3740a1b7a361269",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "PAY",
        "name": "TenX Pay Token",
        "address": "0xb97048628db6b661d4c2aa833e95dbe1a905b280",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "VRS",
        "name": "Veros",
        "address": "0x92e78dae1315067a8819efd6dca432de9dcde2e9",
        "decimals": 6,
        "hasIcon": false
      },
      {
        "symbol": "GNT",
        "name": "Golem Network Token",
        "address": "0xa74476443119a942de498590fe1f2454d7d4ac0d",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SALT",
        "name": "Salt",
        "address": "0x4156d3342d5c385a87d264f90653733592000581",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "BNB",
        "name": "BNB",
        "address": "0xb8c77482e45f1f44de1745f52c74426c631bdd52",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "BAT",
        "name": "Basic Attention Token",
        "address": "0x0d8775f648430679a709e98d2b0cb6250d2887ef",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "KNC",
        "name": "Kyber Network Crystal",
        "address": "0xdd974d5c2e2928dea5f71b9825b8b646686bd200",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "BTU",
        "name": "BTU Protocol",
        "address": "0xb683D83a532e2Cb7DFa5275eED3698436371cc9f",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "DGD",
        "name": "Digix DAO",
        "address": "0xe0b7927c4af23765cb51314a0e0521a9645f0e2a",
        "decimals": 9,
        "skipDecimalsCheck": true,
        "hasIcon": true
      },
      {
        "symbol": "AE",
        "name": "Aeternity",
        "address": "0x5ca9a71b1d01849c0a95490cc00559717fcf0d1d",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "TRX",
        "name": "Tronix",
        "address": "0xf230b790e05390fc8295f4d3f60332c93bed42e2",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "ETHOS",
        "name": "Ethos",
        "address": "0x5af2be193a6abca9c8817001f45744777db30756",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "RDN",
        "name": "Raiden Token",
        "address": "0x255aa6df07540cb5d3d297f0d0d4d84cb52bc8e6",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SNT",
        "name": "Status Network Token",
        "address": "0x744d70fdbe2ba4cf95131626614a1763df805b9e",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SNGLS",
        "name": "SingularDTV",
        "address": "0xaec2e87e0a235266d9c5adc9deb4b2e29b54d009",
        "decimals": 0,
        "hasIcon": true
      },
      {
        "symbol": "GNO",
        "name": "Gnosis Token",
        "address": "0x6810e776880c02933d47db1b9fc05908e5386b96",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "STORJ",
        "name": "StorjToken",
        "address": "0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "ADX",
        "name": "AdEx",
        "address": "0x4470bb87d77b963a013db939be332f927f2b992e",
        "decimals": 4,
        "hasIcon": false
      },
      {
        "symbol": "FUN",
        "name": "FunFair",
        "address": "0x419d0d8bdd9af5e606ae2232ed285aff190e711b",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "CVC",
        "name": "Civic",
        "address": "0x41e5560054824ea6b0732e656e3ad64e20e94e45",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "ICN",
        "name": "ICONOMI",
        "address": "0x888666ca69e0f178ded6d75b5726cee99a87d698",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "WTC",
        "name": "Walton Token",
        "address": "0xb7cb1c96db6b22b0d3d9536e0108d062bd488f74",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "BTM",
        "name": "Bytom",
        "address": "0xcb97e65f07da24d46bcdd078ebebd7c6e6e3d750",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "ZRX",
        "name": "0x Protocol Token",
        "address": "0xe41d2489571d322189246dafa5ebde1f4699f498",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "BNT",
        "name": "Bancor Network Token",
        "address": "0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "MTL",
        "name": "Metal",
        "address": "0xf433089366899d83a9f26a773d59ec7ecf30355e",
        "decimals": 8,
        "hasIcon": false
      },
      {
        "symbol": "PPP",
        "name": "PayPie",
        "address": "0xc42209accc14029c1012fb5680d95fbd6036e2a0",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "LINK",
        "name": "ChainLink Token",
        "address": "0x514910771af9ca656af840dff83e8264ecf986ca",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "KIN",
        "name": "Kin",
        "address": "0x818fc6c2ec5986bc6e2cbf00939d90556ab12ce5",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "ANT",
        "name": "Aragon Network Token",
        "address": "0x960b236a07cf122663c4303350609a66a7b288c0",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "MGO",
        "name": "MobileGo Token",
        "address": "0x40395044ac3c0c57051906da938b54bd6557f212",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "MCO",
        "name": "Monaco",
        "address": "0xb63b606ac810a52cca15e44bb630fd42d8d1d83d",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "LRC",
        "name": "loopring",
        "address": "0xef68e7c694f40c8202821edf525de3782458639f",
        "decimals": 18,
        "skipDecimalsCheck": true,
        "hasIcon": true
      },
      {
        "symbol": "ZSC",
        "name": "Zeus Shield Coin",
        "address": "0x7a41e0517a5eca4fdbc7fbeba4d4c47b9ff6dc63",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "DATA",
        "name": "Streamr DATAcoin",
        "address": "0x0cf0ee63788a0849fe5297f3407f701e122cc023",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "RCN",
        "name": "Ripio Credit Network Token",
        "address": "0xf970b8e36e23f7fc3fd752eea86f8be8d83375a6",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "WINGS",
        "name": "WINGS",
        "address": "0x667088b212ce3d06a1b553a7221e1fd19000d9af",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "EDG",
        "name": "Edgeless",
        "address": "0x08711d3b02c8758f2fb3ab4e80228418a7f8e39c",
        "decimals": 0,
        "hasIcon": true
      },
      {
        "symbol": "MLN",
        "name": "Melon Token",
        "address": "0xbeb9ef514a379b997e0798fdcc901ee474b6d9a1",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "MDA",
        "name": "Moeda Loyalty Points",
        "address": "0x51db5ad35c671a87207d88fc11d593ac0c8415bd",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "PLR",
        "name": "PILLAR",
        "address": "0xe3818504c1b32bf1557b16c238b2e01fd3149c17",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "QRL",
        "name": "QRL",
        "address": "0x697beac28b09e122c4332d163985e8a73121b97f",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "MOD",
        "name": "Modum Token",
        "address": "0x957c30ab0426e0c93cd8241e2c60392d08c6ac8e",
        "decimals": 0,
        "hasIcon": true
      },
      {
        "symbol": "TAAS",
        "name": "Token-as-a-Service",
        "address": "0xe7775a6e9bcf904eb39da2b68c5efb4f9360e08c",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "GRID",
        "name": "GRID Token",
        "address": "0x12b19d3e2ccc14da04fae33e63652ce469b3f2fd",
        "decimals": 12,
        "hasIcon": true
      },
      {
        "symbol": "SAN",
        "name": "SANtiment network token",
        "address": "0x7c5a0ce9267ed19b22f8cae653f198e3e8daf098",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SNM",
        "name": "SONM Token",
        "address": "0x983f6d60db79ea8ca4eb9968c6aff8cfa04b3c63",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "REQ",
        "name": "Request Token",
        "address": "0x8f8221afbb33998d8584a2b05749ba73c37a938a",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "SUB",
        "name": "Substratum",
        "address": "0x12480e24eb5bec1a9d4369cab6a80cad3c0a377a",
        "decimals": 2,
        "hasIcon": true
      },
      {
        "symbol": "MANA",
        "name": "Decentraland MANA",
        "address": "0x0f5d2fb29fb7d3cfee444a200298f468908cc942",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "AST",
        "name": "AirSwap Token",
        "address": "0x27054b13b1b798b345b591a4d22e6562d47ea75a",
        "decimals": 4,
        "hasIcon": true
      },
      {
        "symbol": "R",
        "name": "R token",
        "address": "0x48f775efbe4f5ece6e0df2f7b5932df56823b990",
        "decimals": 0,
        "hasIcon": true
      },
      {
        "symbol": "1ST",
        "name": "FirstBlood Token",
        "address": "0xaf30d2a7e90d7dc361c8c4585e9bb7d2f6f15bc7",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "CFI",
        "name": "Cofoundit",
        "address": "0x12fef5e57bf45873cd9b62e9dbd7bfb99e32d73e",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "ENG",
        "name": "Enigma",
        "address": "0xf0ee6b27b759c9893ce4f094b49ad28fd15a23e4",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "AMB",
        "name": "Amber Token",
        "address": "0x4dc3643dbc642b72c158e7f3d2ff232df61cb6ce",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "XPA",
        "name": "XPlay Token",
        "address": "0x90528aeb3a2b736b780fd1b6c478bb7e1d643170",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "OTN",
        "name": "Open Trading Network",
        "address": "0x881ef48211982d01e2cb7092c915e647cd40d85c",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "TRST",
        "name": "Trustcoin",
        "address": "0xcb94be6f13a1182e4a4b6140cb7bf2025d28e41b",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "TKN",
        "name": "Monolith TKN",
        "address": "0xaaaf91d9b90df800df4f55c205fd6989c977e73a",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "RHOC",
        "name": "RHOC",
        "address": "0x168296bb09e24a88805cb9c33356536b980d3fc5",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "TGT",
        "name": "Target Coin",
        "address": "0xac3da587eac229c9896d919abc235ca4fd7f72c1",
        "decimals": 1,
        "hasIcon": false
      },
      {
        "symbol": "EVX",
        "name": "Everex",
        "address": "0xf3db5fa2c66b7af3eb0c0b782510816cbe4813b8",
        "decimals": 4,
        "hasIcon": true
      },
      {
        "symbol": "ICOS",
        "name": "ICOS",
        "address": "0x014b50466590340d41307cc54dcee990c8d58aa8",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "DNT",
        "name": "district0x Network Token",
        "address": "0x0abdace70d3790235af448c88547603b945604ea",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "٨",
        "name": "Dentacoin",
        "address": "0x08d32b0da63e2c3bcf8019c9c5d849d7a9d791e6",
        "decimals": 0,
        "hasIcon": false
      },
      {
        "symbol": "EDO",
        "name": "Eidoo Token",
        "address": "0xced4e93198734ddaff8492d525bd258d49eb388e",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "CSNO",
        "name": "BitDice",
        "address": "0x29d75277ac7f0335b2165d0895e8725cbf658d73",
        "decimals": 8,
        "hasIcon": false
      },
      {
        "symbol": "COB",
        "name": "Cobinhood Token",
        "address": "0xb2f7eb1f2c37645be61d73953035360e768d81e6",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "ENJ",
        "name": "Enjin Coin",
        "address": "0xf629cbd94d3791c9250152bd8dfbdf380e2a3b9c",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "symbol": "AVT",
        "name": "AVENTUS",
        "address": "0x0d88ed6e74bbfd96b831231638b66c05571e824f",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "symbol": "TIME",
        "name": "Chronobank TIME",
        "address": "0x6531f133e6deebe7f2dce5a0441aa7ef330b4e53",
        "decimals": 8,
        "hasIcon": false
      },
      {
        "symbol": "CND",
        "name": "Cindicator Token",
        "address": "0xd4c435f5b09f855c3317c8524cb1f586e42795fa",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "STX",
        "name": "Stox",
        "address": "0x006bea43baa3f7a6f765f14f10a1a1b08334ef45",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "XAUR",
        "name": "Xaurum",
        "address": "0x4df812f6064def1e5e029f1ca858777cc98d2d81",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "VIB",
        "name": "Vibe",
        "address": "0x2c974b2d0ba1716e644c1fc59982a89ddd2ff724",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "PRG",
        "name": "PRG",
        "address": "0x7728dfef5abd468669eb7f9b48a7f70a501ed29d",
        "decimals": 6,
        "hasIcon": false
      },
      {
        "symbol": "DPY",
        "name": "Delphy Token",
        "address": "0x6c2adc2073994fb2ccc5032cc2906fa221e9b391",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "CDT",
        "name": "CoinDash Token",
        "address": "0x2fe6ab85ebbf7776fee46d191ee4cea322cecf51",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "TNT",
        "name": "Tierion Network Token",
        "address": "0x08f5a9235b08173b7569f83645d2c7fb55e8ccd8",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "DRT",
        "name": "DomRaiderToken",
        "address": "0x9af4f26941677c706cfecf6d3379ff01bb85d5ab",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "SPANK",
        "name": "SPANK",
        "address": "0x42d6622dece394b54999fbd73d108123806f6a18",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "BRLN",
        "name": "Berlin Coin",
        "address": "0x80046305aaab08f6033b56a360c184391165dc2d",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "USDC",
        "name": "USD//C",
        "address": "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48",
        "decimals": 6,
        "hasIcon": true
      },
      {
        "symbol": "LPT",
        "name": "Livepeer Token",
        "address": "0x58b6a8a3302369daec383334672404ee733ab239",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "ST",
        "name": "Simple Token",
        "address": "0x2c4e8f2d746113d0696ce89b35f0d8bf88e0aeca",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "WBTC",
        "name": "Wrapped BTC",
        "address": "0x2260fac5e5542a773aa44fbcfedf7c193bc2c599",
        "decimals": 8,
        "hasIcon": true
      },
      {
        "symbol": "BLT",
        "name": "Bloom Token",
        "address": "0x107c4504cd79c5d2696ea0030a8dd4e92601b82e",
        "decimals": 18,
        "hasIcon": true
      },
      #  NOTE(goranjovic): the following tokens are collectibles
      {
        "symbol": "CK",
        "nft":  true,
        "name": "CryptoKitties",
        "address": "0x06012c8cf97bead5deae237070f9587f8e7a266d",
        "hasIcon": true
      },
      {
        "symbol": "EMONA",
        "nft":  true,
        "name": "EtheremonAsset",
        "address": "0xb2c0782ae4a299f7358758b2d15da9bf29e1dd99",
        "hasIcon": true
      },
      {
        "symbol": "STRK",
        "nft":  true,
        "name": "CryptoStrikers",
        "address": "0xdcaad9fd9a74144d226dbf94ce6162ca9f09ed7e",
        "hasIcon": true
      },
      {
        "symbol": "SUPR",
        "nft":  true,
        "name": "SupeRare",
        "address": "0x41a322b28d0ff354040e2cbc676f0320d8c8850d",
        "hasIcon": true
      },
      {
        "symbol": "KDO",
        "nft":  true,
        "name": "KudosToken",
        "address": "0x2aea4add166ebf38b63d09a75de1a7b94aa24163",
        "hasIcon": true
      },
      {
        "address": "0x99ea4dB9EE77ACD40B119BD1dC4E33e1C070b80d",
        "decimals": 18,
        "symbol": "QSP",
        "name": "Quantstamp Token",
        "hasIcon": true
      },
      {
        "address": "0x80fB784B7eD66730e8b1DBd9820aFD29931aab03",
        "decimals": 18,
        "symbol": "LEND",
        "name": "EHTLend",
        "hasIcon": false
      },
      {
        "address": "0xA15C7Ebe1f07CaF6bFF097D8a589fb8AC49Ae5B3",
        "decimals": 18,
        "symbol": "NPXS",
        "name": "Pundi X Token",
        "hasIcon": false
      },
      {
        "address": "0xA4e8C3Ec456107eA67d3075bF9e3DF3A75823DB0",
        "decimals": 18,
        "symbol": "LOOM",
        "name": "Loom Network",
        "hasIcon": false
      },
      {
        "address": "0x0e0989b1f9B8A38983c2BA8053269Ca62Ec9B195",
        "decimals": 8,
        "symbol": "POE",
        "name": "Po.et Tokens",
        "hasIcon": false
      },
      {
        "address": "0x5732046A883704404F284Ce41FfADd5b007FD668",
        "decimals": 18,
        "symbol": "BLZ",
        "name": "Bluzelle",
        "hasIcon": false
      },
      {
        "address": "0xFA1a856Cfa3409CFa145Fa4e20Eb270dF3EB21ab",
        "decimals": 18,
        "symbol": "IOST",
        "name": "IOSToken",
        "hasIcon": false
      },
      {
        "address": "0x1776e1F26f98b1A5dF9cD347953a26dd3Cb46671",
        "decimals": 18,
        "symbol": "NMR",
        "name": "Numerai",
        "hasIcon": true
      },
      {
        "address": "0x8E870D67F660D95d5be530380D0eC0bd388289E1",
        "decimals": 18,
        "symbol": "PAX",
        "name": "Paxos Standard (PAX)",
        "hasIcon": false
      },
      {
        "address": "0x08d32b0da63e2C3bcF8019c9c5d849d7a9d791e6",
        "decimals": 0,
        "symbol": "DCN",
        "name": "Dentacoin",
        "hasIcon": true
      },
      {
        "address": "0xEA26c4aC16D4a5A106820BC8AEE85fd0b7b2b664",
        "decimals": 18,
        "symbol": "QKC",
        "name": "QuarkChain",
        "hasIcon": false
      },
      {
        "address": "0x45804880De22913dAFE09f4980848ECE6EcbAf78",
        "decimals": 18,
        "symbol": "PAXG",
        "name": "Paxos Gold",
        "hasIcon": false
      },
      {
        "address": "0x865ec58b06bF6305B886793AA20A2da31D034E68",
        "decimals": 18,
        "symbol": "MOC",
        "name": "Moss Coin",
        "hasIcon": false
      },
      {
        "address": "0x408e41876cCCDC0F92210600ef50372656052a38",
        "decimals": 18,
        "symbol": "REN",
        "name": "Republic Token",
        "hasIcon": false
      },
      {
        "address": "0x607F4C5BB672230e8672085532f7e901544a7375",
        "decimals": 9,
        "symbol": "RLC",
        "name": "IEx.ec",
        "hasIcon": true
      },
      {
        "address": "0x8400D94A5cb0fa0D041a3788e395285d61c9ee5e",
        "decimals": 8,
        "symbol": "UBT",
        "name": "Unibright",
        "hasIcon": false
      },
      {
        "address": "0x4f3AfEC4E5a3F2A6a1A411DEF7D7dFe50eE057bF",
        "decimals": 9,
        "symbol": "DGX",
        "name": "Digix Gold Token",
        "hasIcon": false
      },
      {
        "address": "0xEA38eAa3C86c8F9B751533Ba2E562deb9acDED40",
        "decimals": 18,
        "symbol": "FUEL",
        "name": "Etherparty FUEL",
        "hasIcon": true
      },
      {
        "address": "0x00000100F2A2bd000715001920eB70D229700085",
        "decimals": 18,
        "symbol": "TCAD",
        "name": "TrueCAD",
        "hasIcon": false
      },
      {
        "address": "0x6710c63432A2De02954fc0f851db07146a6c0312",
        "decimals": 18,
        "symbol": "MFG",
        "name": "SyncFab Smart Manufacturing Blockchain",
        "hasIcon": false
      },
      {
        "address": "0x543Ff227F64Aa17eA132Bf9886cAb5DB55DCAddf",
        "decimals": 18,
        "symbol": "GEN",
        "name": "DAOstack",
        "hasIcon": false
      },
      {
        "address": "0x0E8d6b471e332F140e7d9dbB99E5E3822F728DA6",
        "decimals": 18,
        "symbol": "ABYSS",
        "name": "The Abyss",
        "hasIcon": false
      },
      {
        "address": "0xB62132e35a6c13ee1EE0f84dC5d40bad8d815206",
        "decimals": 18,
        "symbol": "NEXO",
        "name": "Nexo",
        "hasIcon": false
      },
      {
        "address": "0x0000000000085d4780B73119b644AE5ecd22b376",
        "decimals": 18,
        "symbol": "TUSD",
        "name": "TrueUSD",
        "hasIcon": false
      },
      {
        "address": "0xD0a4b8946Cb52f0661273bfbC6fD0E0C75Fc6433",
        "decimals": 18,
        "symbol": "STORM",
        "name": "Storm Token",
        "hasIcon": false
      },
      {
        "address": "0xaF4DcE16Da2877f8c9e00544c93B62Ac40631F16",
        "decimals": 5,
        "symbol": "MTH",
        "name": "Monetha",
        "hasIcon": true
      },
      {
        "address": "0x00000000441378008EA67F4284A57932B1c000a5",
        "decimals": 18,
        "symbol": "TGBP",
        "name": "TrueGBP",
        "hasIcon": false
      },
      {
        "address": "0xbf2179859fc6D5BEE9Bf9158632Dc51678a4100e",
        "decimals": 18,
        "symbol": "ELF",
        "name": "ELF Token",
        "hasIcon": false
      },
      {
        "address": "0x9992eC3cF6A55b00978cdDF2b27BC6882d88D1eC",
        "decimals": 18,
        "symbol": "POLY",
        "name": "Polymath Network",
        "hasIcon": false
      },
      {
        "address": "0x20F7A3DdF244dc9299975b4Da1C39F8D5D75f05A",
        "decimals": 6,
        "symbol": "SPN",
        "name": "Sapien",
        "hasIcon": false
      },
      {
        "address": "0x1a7a8BD9106F2B8D977E08582DC7d24c723ab0DB",
        "decimals": 18,
        "symbol": "APPC",
        "name": "AppCoins",
        "hasIcon": false
      },
      {
        "address": "0xdAC17F958D2ee523a2206206994597C13D831ec7",
        "decimals": 6,
        "symbol": "USDT",
        "name": "USD Tether (erc20)",
        "hasIcon": false
      },
      {
        "address": "0xa3d58c4E56fedCae3a7c43A725aeE9A71F0ece4e",
        "decimals": 18,
        "symbol": "MET",
        "name": "Metronome",
        "hasIcon": false
      },
      {
        "address": "0x6f259637dcD74C767781E37Bc6133cd6A68aa161",
        "decimals": 18,
        "symbol": "HT",
        "name": "Huobi Token",
        "hasIcon": false
      },
      {
        "address": "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2",
        "decimals": 18,
        "symbol": "WETH",
        "name": "WETH",
        "hasIcon": false
      },
      {
        "address": "0x8f3470A7388c05eE4e7AF3d01D8C722b0FF52374",
        "decimals": 18,
        "symbol": "VERI",
        "name": "Veritaseum",
        "hasIcon": true
      },
      {
        "address": "0x00006100F7090010005F1bd7aE6122c3C2CF0090",
        "decimals": 18,
        "symbol": "TAUD",
        "name": "TrueAUD",
        "hasIcon": false
      },
      {
        "address": "0x66497A283E0a007bA3974e837784C6AE323447de",
        "decimals": 18,
        "symbol": "PT",
        "name": "PornToken",
        "hasIcon": false
      },
      {
        "address": "0xB24754bE79281553dc1adC160ddF5Cd9b74361a4",
        "decimals": 9,
        "symbol": "XRL",
        "name": "XRL",
        "hasIcon": true
      },
      {
        "address": "0xC011A72400E58ecD99Ee497CF89E3775d4bd732F",
        "decimals": 18,
        "symbol": "SNX",
        "name": "Synthetix Network Token",
        "hasIcon": false
      },
      {
        "address": "0x07e3c70653548B04f0A75970C1F81B4CBbFB606f",
        "decimals": 18,
        "symbol": "DLT",
        "name": "Agrello",
        "hasIcon": true
      },
      {
        "address": "0x8207c1FfC5B6804F6024322CcF34F29c3541Ae26",
        "decimals": 18,
        "symbol": "OGN",
        "name": "OriginToken",
        "hasIcon": false
      },
      {
        "address": "0x554C20B7c486beeE439277b4540A434566dC4C02",
        "decimals": 18,
        "symbol": "HST",
        "name": "Decision Token",
        "hasIcon": true
      },
      {
        "address": "0x286BDA1413a2Df81731D4930ce2F862a35A609fE",
        "decimals": 18,
        "symbol": "WABI",
        "name": "Tael",
        "hasIcon": false
      },
      {
        "address": "0xE5a3229CCb22b6484594973A03a3851dCd948756",
        "decimals": 18,
        "symbol": "RAE",
        "name": "RAE Token",
        "hasIcon": false
      },
      {
        "address": "0x24692791Bc444c5Cd0b81e3CBCaba4b04Acd1F3B",
        "decimals": 18,
        "symbol": "UKG",
        "name": "UnikoinGold",
        "hasIcon": true
      },
      {
        "address": "0xD46bA6D942050d489DBd938a2C909A5d5039A161",
        "decimals": 9,
        "symbol": "AMPL",
        "name": "Ampleforth",
        "hasIcon": false
      },
      {
        "address": "0xA4Bdb11dc0a2bEC88d24A3aa1E6Bb17201112eBe",
        "decimals": 6,
        "symbol": "USDS",
        "name": "StableUSD",
        "hasIcon": false
      },
      {
        "address": "0xB98d4C97425d9908E66E53A6fDf673ACcA0BE986",
        "decimals": 18,
        "symbol": "ABT",
        "name": "ArcBlock Token",
        "hasIcon": false
      },
      {
        "address": "0x81c9151de0C8bafCd325a57E3dB5a5dF1CEBf79c",
        "decimals": 18,
        "symbol": "DAT",
        "name": "Datum Token",
        "hasIcon": false
      },
      {
        "address": "0xa6a840E50bCaa50dA017b91A0D86B8b2d41156EE",
        "decimals": 18,
        "symbol": "EKO",
        "name": "EchoLink",
        "hasIcon": false
      },
      {
        "address": "0x2C4e8f2D746113d0696cE89B35F0d8bF88E0AEcA",
        "decimals": 18,
        "symbol": "OST",
        "name": "Simple Token 'OST'",
        "hasIcon": false
      },
      {
        "address": "0xc92D6E3E64302C59d734f3292E2A13A13D7E1817",
        "decimals": 8,
        "symbol": "FXC",
        "name": "FUTURAX",
        "hasIcon": false
      },
      {
        "address": "0x4a57E687b9126435a9B19E4A802113e266AdeBde",
        "decimals": 18,
        "symbol": "FXC",
        "name": "Flexacoin",
        "hasIcon": false
      },
      {
        "address": "0xC86D054809623432210c107af2e3F619DcFbf652",
        "decimals": 18,
        "symbol": "UPP",
        "name": "Sentinel Protocol",
        "hasIcon": false
      },
      {
        "address": "0x5Af2Be193a6ABCa9c8817001F45744777Db30756",
        "decimals": 8,
        "symbol": "BQX",
        "name": "Bitquence",
        "hasIcon": false
      },
      {
        "address": "0x69b148395ce0015c13e36bffbad63f49ef874e03",
        "symbol": "DTA",
        "name": "Data",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "address": "0x57ab1e02fee23774580c119740129eac7081e9d3",
        "symbol": "SUSD",
        "name": "Synth sUSD",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "address": "0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643",
        "symbol": "CDAI",
        "name": "Compound Dai",
        "decimals": 8,
        "hasIcon": false
      },
      {
        "address": "0xba11d00c5f74255f56a5e366f4f77f5a186d7f55",
        "symbol": "BAND",
        "name": "BandToken",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "address": "0xa7fc5d2453e3f68af0cc1b78bcfee94a1b293650",
        "symbol": "SPIKE",
        "name": "Spiking",
        "decimals": 10,
        "hasIcon": false
      }
    ]

  if getCurrentNetwork() == Network.Testnet:
    return %* [
      {
        "symbol": "STT",
        "name": "Status Test Token",
        "address": "0xc55cf4b03948d7ebc8b9e8bad92643703811d162",
        "decimals": 18,
        "hasIcon": true
      },
      {
        "symbol": "HND",
        "name": "Handy Test Token",
        "address": "0xdee43a267e8726efd60c2e7d5b81552dcd4fa35c",
        "decimals": 0,
        "hasIcon": false
      },
      {
        "symbol": "LXS",
        "name": "Lucky Test Token",
        "address": "0x703d7dc0bc8e314d65436adf985dda51e09ad43b",
        "decimals": 2,
        "hasIcon": false
      },
      {
        "symbol": "ADI",
        "name": "Adi Test Token",
        "address": "0xe639e24346d646e927f323558e6e0031bfc93581",
        "decimals": 7,
        "hasIcon": false
      },
      {
        "symbol": "WGN",
        "name": "Wagner Test Token",
        "address": "0x2e7cd05f437eb256f363417fd8f920e2efa77540",
        "decimals": 10,
        "hasIcon": false
      },
      {
        "symbol": "MDS",
        "name": "Modest Test Token",
        "address": "0x57cc9b83730e6d22b224e9dc3e370967b44a2de0",
        "decimals": 18,
        "hasIcon": false
      }  
    ]

  if getCurrentNetwork() == Network.Rinkeby:
    return %* [
      {
        "symbol": "MOKSHA",
        "name": "Moksha Coin",
        "address": "0x6ba7dc8dd10880ab83041e60c4ede52bb607864b",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "symbol": "KDO",
        "nft": true,
        "name": "KudosToken",
        "address": "0x93bb0afbd0627bbd3a6c72bc318341d3a22e254a",
        "hasIcon": false
      },
      {
        "symbol": "WIBB",
        "name": "WIBB",
        "address": "0x7d4ccf6af2f0fdad48ee7958bcc28bdef7b732c7",
        "decimals": 18,
        "hasIcon": false
      },
      {
        "symbol": "STT",
        "name": "Status Test Token",
        "address": "0x43d5adc3b49130a575ae6e4b00dfa4bc55c71621",
        "decimals": 18,
        "hasIcon": false
      }
    ]

  if getCurrentNetwork() == Network.XDai:
    return %* [
      {
        "symbol": "BUFF",
        "name": "buffiDai",
        "address": "0x3e50bf6703fc132a94e4baff068db2055655f11b",
        "decimals": 18,
        "hasIcon": false
      }
    ]

  return %* []