import Vue from 'vue';
import Signin from '../signin.vue';
import TurbolinksAdapter from 'vue-turbolinks';

Vue.use(TurbolinksAdapter);

document.addEventListener('turbolinks:load', () => {
    const el = document.body.appendChild(document.createElement('signin'));
    const signin = new Vue({
        el,
        render: h => h(Signin)
    });

    console.log('/signin page');
});
