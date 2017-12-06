<template lang="pug">
  li.todo(:class="{completed: todo.done, editing: editing}")
    .view
      input.toggle(type= "checkbox"  :checked= "todo.done" @change= "toggle({todo: todo})")
      label(@dblclick="editing = true") {{todo.text}}
      button.destroy(@click="destroy({todo: todo})")
    input.edit(
      v-show="editing" v-focus="editing" :value="todo.text"
      @keyup.enter="doneEdit" @keyup.esc="cancelEdit" @blur="doneEdit"
    )
</template>
<script lang="coffee">
  import {mapMutations} from "vuex"
  export default
    props: ["todo"]
    data: ->editing: no
    directives:
      focus: (el, binding, vnode)->
        if binding.value then vnode.context.$nextTick ->el.focus()
    methods: do ->
      Locals=
        doneEdit: (e)->
          unless value= e.target.value.trim() then @destroy @todo
          else if @editing then @edit todo: @todo, value: value; @editing= no
        cancelEdit: (e)->
          e.target.value= @todo.text; @editing= no
      Mutations= mapMutations "add destroy edit toggle".split(" ")
      {Locals..., Mutations...}
</script>