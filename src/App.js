import React, {useEffect} from 'react';
import './App.css';

function App() {

    const loadProvider = async () => {

    }

    useEffect(() => {
        loadProvider();
    }, []); // Or [] if effect doesn't need props or state

    const enableEth = async ()=> {
        try {
            const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
            console.log("accounts", accounts)
        }
        catch (e){
            console.log(e)
        }

    }
  return (
    <>
     <div className={"faucet-wrapper"}>
       <div className={"faucet"}>
        <div className={"balance-view is-size-2"}>
            Current Balance: <strong>10</strong> ETH
        </div>
           <button className={"btn mr-2"} onClick={()=> enableEth()}>Enable Eth</button>
           <button className={"btn mr-2"}>Donate</button>
           <button className={"btn mr-2"}>Withdraw</button>
       </div>
     </div>
    </>
  );
}

export default App;
