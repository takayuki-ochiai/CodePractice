
//for sample
var options = [
  {
    id: "koba04",
    iconUrl: "https://secure.gravatar.com/avatar/45daf58c77e9dbbab5a1c8a5afc7ac5c?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    hasChecked: false
  },
  {
    id: "jnchito",
    iconUrl: "https://avatars.githubusercontent.com/u/1148320?v=2",
    hasChecked: false
  }
];

(function() {
  var React = require('react');
  var IndexFilter = require("./index-filter.jsx");
  React.render(<IndexFilter options={options} title={"TextIndex"} />, document.body);
}) ();