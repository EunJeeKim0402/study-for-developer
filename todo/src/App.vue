<template>
  <div id="app" class="container">
    <h1 class="text-center">Todo App</h1>
    <CompletedTodo />
    <AddTodo />
    <hr>
    <Todo_List />
    <UserList />
  </div>
</template>

<script>
import Todo_List from '@/components/Todo_List.vue';
import AddTodo from '@/components/AddTodo.vue';
import CompletedTodo from '@/components/CompletedTodo.vue';
import UserList from '@/components/UserList.vue';
export default {
  components: {
    Todo_List,
    AddTodo,
    CompletedTodo,
    UserList
},
  // data() {
  //   return {
  //     todoText: '',
      // todos: [
      //   { id: 1, text: 'buy a car', checked: false },
      //   { id: 2, text: 'play game', checked: false },
      // ]
    // }
  // },
  // methods: {
    // deleteTodo(id) {
      // const index = this.todos.findIndex(todo => {
      //   return todo.id === id;
      // });
      // this.todos.splice(index, 1);
      //this.todos = this.todos.filter(todo => todo.id !== id);
    // },
    // addTodo(value) {
    //   this.todos.push ({
    //     id: Math.random(),
    //     text: value,
    //     checked: false
    //   });
    //   this.todoText = '';
    // },
    // toggleCheckbox({id, checked}) {
    //   const index = this.todos.findIndex(todo => {
    //     return todo.id === id;
    //   });
    //   this.todos[index].checked = checked;
    // }
  // }
}
</script>
