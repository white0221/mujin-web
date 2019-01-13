<template>
  <form accept-charset="UTF-8" v-on:submit.prevent>
    <input type="text" v-model="email" placeholder="email">
    <input type="password" v-model="password" placeholder="password">
    <button type="submit" v-on:click="sendForm">send</button>
  </form>
</template>

<script>
import axios from 'axios';

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;
axios.defaults.headers.common["Content-Type"] = "application/json";
axios.defaults.headers.common["charset"] = "utf-8";
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
export default {
  data: function() {
    return {
      email: "",
      password: ""
    }
  },
  methods: {
    sendForm: function(e){
      axios.post("/signin", {
        "session": {
          "email": this.email,
          "password": this.password
        }
      })
      .then(response => {
        console.log(response);
      })
      .catch(response => {
        console.log('error');
        console.log(response);
      });
    }
  }
}
</script>