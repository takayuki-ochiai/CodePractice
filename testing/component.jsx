'use strict';
(function() {
var IndexFilter = require('react-index-filter'),
      React = require('react');

var options = [{
  id : "takayuki-ochiai",
  iconUrl: "https://avatars.githubusercontent.com/u/7022843?v=3",
  hasChecked: false
}];

var Hello = React.createClass({
  render: function() {
    return (
      <h1>Hello, {this.props.name} World !</h1>
    );
  }
});

React.render(
  <IndexFilter options={options} title={"hoge"} />,
  document.getElementById('app')
);
})();
