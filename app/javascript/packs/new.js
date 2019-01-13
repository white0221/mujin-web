import Vue from 'vue';
import New from '../new.vue';
import TurbolinksAdapter from 'vue-turbolinks';

Vue.use(TurbolinksAdapter);

document.addEventListener('turbolinks:load', () => {
    //const el = document.body.appendChild(document.createElement('new'));
    const new_ = new Vue({
        el: '#new_app',
        render: h => h(New)
    }).$mount('#new_app');

    console.log('/new page');
});
