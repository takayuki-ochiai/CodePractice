'use strict';
(function() {
var IndexFilter = require('react-index-filter'),
      React = require('react');

  var options = [
    {
      id : "sample-1",
      iconUrl: "https://avatars.githubusercontent.com/u/7022843?v=3",
      hasChecked: false
    },
    {
      id : "sample-2",
      iconUrl: "https://avatars.githubusercontent.com/u/7022843?v=3",
      hasChecked: false
    },
    {
      id : "sample-3",
      iconUrl: "https://avatars.githubusercontent.com/u/7022843?v=3",
      hasChecked: false
    },
    {
      id : "sample-4",
      iconUrl: "https://avatars.githubusercontent.com/u/7022843?v=3",
      hasChecked: false
    }
  ];


  React.render(
    <IndexFilter options={options} title={"Sample Item List"} />,
    document.getElementById('app')
  );
})();
