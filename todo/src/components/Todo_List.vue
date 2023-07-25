<template>
    <div>
        <TodoList 
            v-for="todo in todos" 
            :key="todo.id"
            :todo="todo"
            @toggle-checkbox="toggleCheckbox"
            @click-delete="deleteTodo"
        />
    </div>        
</template>
<script>
import TodoList from '@/components/TodoList.vue';
export default {
    components: {
        TodoList
    },
    computed: {
        todos() {
            return this.$store.state.todo.todos;
        }
    },
    methods: {
        toggleCheckbox(value) {
            this.$emit('toggle-checkbox', value)
        },
        deleteTodo(todoId) {
            this.$emit('click-delete', todoId);
        }
    }
}
</script>
<style>

</style>