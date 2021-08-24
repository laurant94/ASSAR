if( typeof vuetify == "undefined" ){
  const vuetify = new Vuetify()
  const store = new Vuex.Store({
    state: {
      count: 0
    },
    mutations: {
      increment (state) {
        state.count++
      }
    }
  })

  var vue = new Vue({
    el: "#app",
    store: store,
    vuetify: vuetify,
    data: {
      drawer: false
    },

    methods: methods
  })

}

