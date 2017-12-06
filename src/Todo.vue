<style src="todomvc-app-css/index.css"></style>
<template lang="pug">
  section.todoapp
    header.header
      h1 todos
      input.new-todo(
        autofocus autocomplete="off"  placeholder="What needs to be done?"
        @keyup.enter="add"
      )
    section.main(v-show="todos.length")
      input.toggle-all#toggle-all(type="checkbox" :checked="hasAllCompleted" @change="toggleAll({done: !hasAllCompleted})")
      label(for="toggle-all")
      ul.todo-list
        todo-item(v-for="(todo, index) in finders[scope](todos)" :key="index" :todo="todo")
    footer.footer(v-show="todos.length")
      span.todo-count <strong> {{remaining}} </strong> {{remaining | pluralize("item")}} left
      ul.filters
        li(v-for="(val, key) in finders")
          a(
            :href="'#/' + key"  :class="{selected: scope === key}"
            @click="scope = key"
          ) {{key | capitalize}}
      button.clear-completed(v-show="todos.length > remaining" @click="clearCompleted") Clear completed
</template>

<script lang="coffee">
  import {mapState, mapMutations} from "vuex"
  import TodoItem from "./TodoItem.vue"

  finders=
    all      : (items)->items
    active   : (items)->items.filter (item)-> not item.done
    completed: (items)->items.filter (item)-> item.done 

  export default
    components: {TodoItem}
    data: -> scope: "all", finders: finders
    computed:
      todos          : -> @$store.state.todos
      remaining      : -> @todos.filter((todo)-> not todo.done).length
      hasAllCompleted: -> @todos.every (todo)-> todo.done

    methods: do ->
      Locals= 
        add: (e)->
          if value= e.target.value.trim() then @$store.commit "add", text: value 
          e.target.value= ""
      Mutations= mapMutations "toggleAll clearCompleted".split(" ")
      {Locals..., Mutations...}

    filters:
      pluralize: (number, unit)-> if number is 1 then unit else unit + 's'
      capitalize: (s)-> s.charAt(0).toUpperCase() + s.slice(1)
</script>

