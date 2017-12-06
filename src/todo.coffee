import Vue from "vue"
import Vuex from "vuex"
Vue.use Vuex
window.localStorage.clear()

export default new Vuex.Store
  state: todos: [
    {text: "風呂の掃除をする", done: no}
    {text: "オイルを交換する", done: no}
  ]
  mutations:
    add           : (state, payload)-> state.todos.push text: payload.text, done: no
    destroy       : (state, payload)-> state.todos.splice state.todos.indexOf(payload.todo), 1
    edit          : (state, payload)-> payload.todo.text= payload.value
    toggle        : (state, payload)-> payload.todo.done = not payload.todo.done
    toggleAll     : (state, payload)-> state.todos.forEach (item)->item.done= payload.done
    clearCompleted: (state)         -> state.todos= state.todos.filter (item)-> not item.done

