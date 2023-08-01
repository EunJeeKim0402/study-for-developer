<template>
  <div class="menu">
    <a v-for="cloth in menus" :key="cloth"> 
      <span class="category">{{ cloth }}</span>
    </a>
  </div>
  <div class="div1">
    <h1>상품</h1>
  </div>
  <div class="productList" v-for="(product, i) in productList" :key="i">
    <img v-bind:src="productList[i].image" alt="">
    <h4>{{ productList[i].products }}</h4>
    <p>{{ productList[i].price }}</p>
    <button @click="like[0]++">찜</button>
    <span>찜한 수 : {{ like[0] }}</span>
  </div>
  <!--<div v-for="(a, i) in products" :key="i">
    <h4>{{ products[i] }}</h4>
    <p>{{ price[i] }}</p>
  </div>-->
  <!-- <div v-for="product in list" :key="product.id">
    <h4>{{ product.product_name }}</h4>
    <p>{{ product.product_price }}만원</p>
    <p>{{ product.product_image }}</p> 
  </div>-->
</template>

<script>
import data from './assets/data.js'; // data부분은 자유롭게 작명 가능

export default {
  name: 'App',  
  data() {
    return {
      menus: ['Home', 'Products', 'About'],
      productList: data,
      like: new Array(data.length).fill(0),
      list: []
      // body: '',
      // product_name: '',
      // product_price: '',
      // product_image: ''
    }
  },
  mounted() { // 페이지 시작 후 자동 함수실행
    this.getList();
  },
  methods: {
    increaseLike(index) {
      this.productList[index].like++;
    },
    getList() {
      this.$axios
        .get("http://localhost:3000/product", {
          params: this.body,
          withCredentials: true,
        })
        .then((res) => {
          console.log(res);

          if (res.data.success) {
            this.list = res.data.list; // 데이터를 list에 저장
          } else {
            alert("데이터 가져오기 실패했습니다.");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.menu {
  background: lightpink;
  padding: 15px;
  border-radius: 5px;
}
.menu a {
  color: black;
  padding: 10px;
}
.div1 {
  padding: 5px;  
}
.category {
  font-size: large;
}
.productList {
  display: inline-block;
  padding: 10px;
}
.productList img {
  width: 350px;
  height: 350px;
}
</style>
