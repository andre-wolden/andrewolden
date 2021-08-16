'use strict';

require("./styles.scss");
require("./Components/CollapseAnimator/collapse-animator.scss");
require("./Components/CollapseTransition/collapse-transition.scss");

const {Elm} = require('./Main');
var app = Elm.Main.init({
    flags: {
        aFlagValue: 'for/example/a/base/path'
    }
});



// ----------------------------------------
// Subscribe to scroll values y
let last_known_scroll_position = 0;
let ticking = false;

function doSomething(scroll_pos) {
    app.ports.messageReceiver.send(scroll_pos.toString());
}

window.addEventListener('scroll', function(e) {
    last_known_scroll_position = window.scrollY;

    if (!ticking) {
        window.requestAnimationFrame(function() {
            doSomething(last_known_scroll_position);
            ticking = false;
        });

        ticking = true;
    }
});
// ----------------------------------------
