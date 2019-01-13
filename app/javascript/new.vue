<template>
  <form accept-charset="UTF-8" v-on:submit.prevent>
    <input type="text" v-model="username" placeholder="username">
    <input type="text" v-model="email" placeholder="email">
    <input type="password" v-model="password" placeholder="password">
    <input type="password" v-model="password_confirm" placeholder="password(confirm)">
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
      username: "",
      email: "",
      password: "",
      password_confirm: ""
    }
  },
  methods: {
    sendForm: function(e){
      axios.post("/signup", {
        "user": {
          "user_name": this.username,
          "email": this.email,
          "password": this.password,
          "password_confirmation": this.password_confirm,
        }
      })
      .then(response => {
        var turbolinksFunc = response["data"];
        Function(turbolinksFunc)();
      })
      .catch(response => {
      });
    }
  }
}
</script>