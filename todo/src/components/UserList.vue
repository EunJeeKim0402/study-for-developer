<template>
  <div>
    User List
    <div v-for="user in poeple" :key="user.id">
        {{ user.name }}
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
export default {
    created(){        
        this.getUsers();
    },
    computed: {
        // ...mapState([
        //     //{people: 'users'},
        //     users: state => state.user.users
        // ])
        ...mapState('user', {
            //{people: 'users'},
            users: state => state.users
        })
        // users() { 이 코드를 줄인게 위 mapState
        //     return this.$store.state.users;
        // },
        // todos() {
        //     return this.$store.state.todos;
        // }
    },  
    methods: {
        ...mapActions('user', ['getUsers'])
        // getUsers() {
        //     this.$store.dispatch('getUsers');
        // }
    }
}
</script>

<style>

</style>