import React, {useEffect, useState} from 'react';
import './App.css';
import Web3 from 'web3';
import detectEthereumProvider from '@metamask/detect-provider'

function App() {
    const [web3Api, setWeb3Api] = useState({provider: null, web3: null});
    const [account, setAccount] = useState(null);

    const loadProvider = async () => {
        const provider = await detectEthereumProvider();
        if (provider) {
            await provider.request({
                method: 'eth_requestAccounts'
            })
            setWeb3Api({provider, web3: new Web3(provider)})
        } else {
            console.error("ACCESS DENIED")
        }
    }


    useEffect(() => {
        loadProvider();
    }, []);

    useEffect(() => {
        const getAccount = async () => {
            const accounts = await web3Api.web3.eth.getAccounts();
            setAccount(accounts[0])
        };
        web3Api.web3 && getAccount()
    }, [web3Api.web3]);

    return (
        <>
            <div className={"faucet-wrapper"}>
                <div className={"faucet"}>
           <span>
               <strong>Account: </strong>
           </span>
                    <h1>{account ? account :
                        <button className={"button is-info mr-2"}
                                onClick={() => {
                                    web3Api.provider.request({
                                        method: 'eth_requestAccounts'
                                    })
                                }}
                        >Connect Wallet</button>}</h1>
                    <div className={"balance-view is-size-2 mb-2"}>
                        Current Balance: <strong>10</strong> ETH
                    </div>
                    <button className={"button is-primary mr-2"}>Donate</button>
                    <button className={"button is-link mr-2"}>Withdraw</button>
                </div>
            </div>
        </>
    );
}

export default App;
