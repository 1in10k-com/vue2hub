<template>
  <div class="tem">
    <div class="account">
      账号地址:
      <p> {{account}}</p>
    </div>
    <div class="price">
      当前拍卖价：
      <p>{{price}}</p>
    </div>
    <div class="buy">
      <button @click="buy">点击竞价</button>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
    account: "0x515E3ce515EF75db0117e46258Aa0B33f2081234",
    price: "100000 eth"
    }
  },
  methods:{
    buy(){
      alert("123")
    }
  }
}
</script>

<style scoped>

.tem {
  display: block;
  width: 400px;
  height: 210px;
  color: orange;
  float:right;
  margin-right: 300px;
  margin-top: 100px;
}
.account{
  display: block;
  height: 70px;
  border-style: solid;
  border-width: 3px;
  box-sizing: border-box;
  text-align: center;
  border-bottom: none;
}
.price{
  display: block;
  height: 70px;
  border-style: solid;
  border-width: 3px;
  box-sizing: border-box;
  text-align: center;
  border-bottom: none;
}
.buy{
  display: block;
  height: 70px;
  border-style: solid;
  border-width: 3px;
  box-sizing: border-box;
}
.buy button {
  display: block;
  width: 100px;
  height: 30px;
  margin:20px auto;
}
</style>
