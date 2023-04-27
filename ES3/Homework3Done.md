# Homework 1
## Blockchain

Discuss in your teams

### 1. Why is client diversity important for Ethereum

Client diversity is important for Ethereum because it strengthens the network by eliminating the vulnerability of overreliance on any one consensus or execution client, making the network more resilient to attacks and bugs.[1, 2] It also eases pressure on developers by distributing responsibilities across multiple teams, promoting growth and innovation within the ecosystem. Ethereum's Proof of Stake (PoS) reward mechanism inherently disincentivizes one client from capturing a majority of market share, indirectly encouraging client diversity through penalties built into the consensus process blocknative.com. Achieving client diversity requires collective action from individual users, mining/validator pools, and institutions like major dApps and exchanges to adopt minority clients and create a more balanced distribution of clients across the network[2].

#### 2. Where is the full Ethereum state held ?

The state data in an account-based blockchain is stored in a local data store of a "full/archival" node [3]. The state data is assembled into a state tree linked to the account and to the blocks, and is physically part of the blockchain, which can be found in the .ethereum folder of each full node in a leveldb database [3]. However, state data can be ephemeral and is not strictly necessary to store, unlike chain data, which is explicit and stored as the block chain itself [3]. A "pruning" technique can be applied to discard old state data, which is no longer valid, as state data is implicit and its value is known only from calculation, not from the actual information communicated [3].

#### 3. What is a replay attack ? , which 2 pieces of information can prevent it ?
A replay attack is a type of cyber attack where a perpetrator intercepts a secure network communication, delays or resends it to deceive the receiver, and executes unauthorized actions or gains unauthorized access. [4, 5]

To prevent replay attacks, two approaches can be utilized:

a. Random session keys: A completely random session key can be established, which is a type of code that is only valid for one transaction and cannot be used again [1].

b. Timestamps: To limit the window of opportunity for an attacker to eavesdrop, intercept, and resend the message, timestamps can be used on all messages. This approach prevents hackers from resending messages sent longer ago than a certain length of time [1].

#### 4. In a contract, how do we know who called a view function ?

To determine who called a view function in a contract, you can use the `msg.sender` keyword within the function. However, since view functions don't modify the contract state and don't require a transaction to be executed, the `msg.sender` value may not be as reliable as it would be in a transactional function. It's important to note that view functions do not consume gas when called externally, but they do cost gas when called internally by other contract functions, as the entire network has to perform the calculation [6].


### References
1. blocknative.com, https://ethereum.org/en/developers/docs/nodes-and-clients/client-diversity/, 2023-04-25
2. ethereum.org, https://www.blocknative.com/blog/ethereum-client-diversity, 2023-04-25
3. ethereum.stackexchange.com, https://ethereum.stackexchange.com/questions/359/where-is-the-state-data-stored, 2023-04-25
4. Kaspersky, Replay attack, https://www.kaspersky.co.in/resource-center/threats/replay-attack, 2023-04-25
5. Comparitech, Replay attack: What it is and how to prevent it, https://www.comparitech.com/blog/information-security/replay-attack/, 2023-04-25
6. ethereum.stackexchange.com, https://ethereum.stackexchange.com/questions/49253/does-view-functions-cost-gas-and-how-to-send-transaction-in-a-proper-way, 2023-04-25  
