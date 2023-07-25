export default {
    namespaced: true,
    state: { // Vuex에서 중앙에 저장되는 데이터
        todos: [
            { id: 1, text: 'buy a car', checked: false },
            { id: 2, text: 'play game', checked: false },
        ],        
    },
    mutations: { // Vuex상태를 변경하기 위해 사용되는 메소드
        ADD_TODO(state, value) {
            state.todos.push ({
                id: Math.random(),
                text: value,
                checked: false
            });
        },
        TOGGLE_TODO(state, {id, checked}) {
            const index = state.todos.findIndex(todo => {
                return todo.id === id;
            });
            state.todos[index].checked = checked;
        },
        DELETE_TODO(state, todoId){
            const index = state.todos.findIndex(todo => {
                return todo.id === todoId;
              });
            state.todos.splice(index, 1);
        }
    },
    actions: { // 비동기작업에서 state를 변경할 때 사용
        addTodo({ commit }, value) {
            setTimeout(function() {
                commit('ADD_TODO', value);
            }, 500);            
        },
        toggleTodo({ commit }, payload){
            setTimeout(function() {
                commit('TOGGLE_TODO', payload);
            }, 500);    
        },
        deleteTodo({ commit }, todoId){
            setTimeout(function() {
                commit('DELETE_TODO', todoId);
            }, 500);    
        }
    },
    getters: { // Vuex State에서 계산된 상태 값을 반환하는 메소드
        // computed랑 비슷함
        numberOfCompletedTodo: state => {
            return state.todos.filter(todo => todo.checked).length;
        }
    }
}