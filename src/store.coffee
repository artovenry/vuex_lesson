import Vue from "vue"
import Vuex from "vuex"
Vue.use Vuex

export default new Vuex.Store
  state:
    count: 0
    two: 2
  mutations: 
    increment: (state)-> state.count++
    decrement: (state)-> state.count--
  actions: 
    increment: (context)-> context.commit "increment"
    decrement: (context)-> context.commit "decrement" for [0..3]
    incrementIfOdd: (context)->
      context.commit "increment" if (context.state.count + 1) % 2 is 0 
    incrementAsync: (context)->
      
      new Promise (resolve, reject)->
        _.delay ->
          context.commit "increment"; resolve()
        , 1000
    decrementAsync: (context)->
      await context.dispatch("incrementAsync")
      console.log "HOGE"
      context.commit "decrement"

  getters:
    evenOrOdd: (state)-> if state.count % 2 then "even" else "odd"
    bonbon: (state)->if state.count > 5 then "bonbon" else ""

