import { Elm } from './src/ReverseText.elm'

Elm.ReverseText.init({
    node: document.getElementById('app2'),
    flags: {
        year: new Date().getFullYear(),
    }
})