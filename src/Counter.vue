<template lang="pug">
  #site
    |clicked: {{two}}{{$store.state.count}} times, count is {{AliasForEvenOrOdd}}.
    | a--nd: {{bonbon}}, {{honge}}
    button(@click="increment") +
    button(@click="decrement") -
    button(@click="incrementIfOdd") Increment if odd
    button(@click="incrementAsync") Increment async
    button(@click="decrementAsync") Decrement async
</template>

<script lang="coffee">
  import {mapState, mapGetters, mapActions} from "vuex"

  export default
    data: ->
      hoge: 100
    computed: do ->
      Locals=
        honge: ->@hoge * 100
      Getters= mapGetters
        AliasForEvenOrOdd: "evenOrOdd"
        bonbon: "bonbon"
      States= mapState
        two: (state)->state.two + @hoge
      {Locals..., Getters..., States...}

    methods: mapActions
      increment: "increment"
      decrement: "decrement"
      incrementIfOdd: "incrementIfOdd"
      incrementAsync: "incrementAsync"
      decrementAsync: "decrementAsync"


</script>

