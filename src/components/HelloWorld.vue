<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h1>{{ title }}</h1>
    <h1>{{ greeting }}</h1>
    <input type="text" v-model="greeting"> <br/>
    <button @click="modify()">modify</button>
    <button @click="fetchGreeting()">fetch</button>
  </div>
</template>

<script>
import { ethers, providers } from "ethers";
import Greeter from "../artifacts/contracts/Greeter.sol/Greeter.json";
console.log("ether: " + ethers);
console.log("Greeter: " + Greeter);

const greeterAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
console.log(greeterAddress);

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },

  data() {
    return {
      title: "titile2",
      greeting: "greeting2",
    };
  },
  onload() {},
  async mounted() {
    let that = this;
    console.log("that is :" + that);
    console.log("provider is :" + providers);
    
  },
  methods: {
    async requestAccount() {
      await window.ethereum.request({ method: "eth_requestAccounts" });
    },

    async fetchGreeting() {
      if (typeof window.ethereum !== "undefined") {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const contract = new ethers.Contract(
          greeterAddress,
          Greeter.abi,
          provider
        );
        try {
          const data = await contract.greet();
          this.greeting = data;
          console.log("data: ", data);
        } catch (err) {
          console.log("Error: ", err);
        }
      }
    },

    async modify() {
      let that = this;
      if (!that.greeting) return;
      if (typeof window.ethereum !== "undefined") {
        await that.requestAccount();
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract(
          greeterAddress,
          Greeter.abi,
          signer
        );
        const transaction = await contract.setGreeting(that.greeting);
        await transaction.wait();
        that.fetchGreeting();
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
