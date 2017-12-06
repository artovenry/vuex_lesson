import Vue from "vue"
import Vuex from "vuex"
import Counter from "Counter.vue"
import store from "store.coffee"
import Todo from "Todo.vue"
import todo from "todo.coffee"

new Vue
  render: (h)->h Todo
  store: todo
  created: ->
    document.addEventListener "DOMContentLoaded", =>@$mount "#site"

