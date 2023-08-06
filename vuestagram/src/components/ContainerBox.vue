<template lang="">
  <div>
    <PostList :post="post[i]" v-for="(a,i) in post" :key="i" />
    <!-- <PostList :post="post[1]"/>
    <PostList :post="post[2]"/> -->
  </div>
</template>

<script>
import PostList from './PostList.vue';
export default {
  components: {
    PostList: PostList,
  },
  props: {
    post: Array,
  }
}
</script>

<style>

</style>