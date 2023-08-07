# GAS OPTIMISATION TEAM 10

- Your task is to edit and optimise the Gas.sol contract. 
- You cannot edit the tests & 
- All the tests must pass.
- You can change the functionality of the contract as long as the tests pass. 
- Try to get the gas usage as low as possible. 

![Screenshot 2023-08-06 at 13 47 11](https://github.com/charifmews/gasoptimizationchallenge/assets/3293323/3c21d11b-e634-48e8-8c24-7623a5dd9474)
![WhatDidItCostMeme](https://cdn.discordapp.com/attachments/1136712047141331094/1137713239036264458/Screenshot_2023-08-06_at_13.46.06.png)

## Learnings

Group 10 learned the following things

- Dead code elimination should always be the first thing to do. If it is not about saving gas (which it had the biggest impact), it is because fewer lines of code results in fewer potential security bugs. 
- Newest compiler (from 0.8.18 to 0.8.21 didn't make a difference, but from 0.8.0 to 0.8.18 did)
- Foundry optimizer config settings makes a lot of impact and we finetuned it
- Mapping > Array (BasBas) This makes a lot of impact
- Challenge every line of code after you removed dead code (JoubelB)
- Yul is overrated and the solidity compiler is pretty good or our skills are not good enough. Still we believe if the smart contract is fully written in Yul it would probably be faster if executed well. Curious if there is overhead when you add `assembly {}` blocks in solidity functions or that we missed an compiler optimizations
- Suprisingly defining uint8 vs uint can increase gas costs
- Simpele if statements are more gas efficient than an if statement with more logic

## To run tests & gas report with verbatim trace 
Run: `forge test --gas-report -vvvv`

## To run tests & gas report
Run: `forge test --gas-report`

## To run a specific test
RUN:`forge test --match-test {TESTNAME} -vvvv`
EG: `forge test --match-test test_onlyOwner -vvvv`
