var ask = "質問変数";

function dateToString(d) {
  return [
    d.getFullYear(),
    d.getMonth() + 1,
    d.getDate()
  ].join("-");
};


var Divider = React.createClass({
  render: function(){
    return(
      <div className="divider">
        <h2>{this.props.children}</h2><hr />
      </div>
    );
  }
})

var ListSurveys = React.createClass({
  render: function() {
    var props = {
      one: 'foo',
      two: 'foo'
    };
    return(
      <div className="ListSurveys">
        <SurveyTable one={props.one} />
        <SurveyTable one={props.two} />
      </div>
    );
  }
})

var SurveyTable = React.createClass({
  render: function() {
    return(
      <div className="surveytable">{this.props.one} </div>
    );
  }
})

var SaveButton = React.createClass({
  render: function() {
    return (
      <input type="submit" value={this.props.value} onClick={this.handleClick} />
    );
  },

  handleClick: function(e) {
    e.preventDefault();
    console.log("保存ボタンが押されたよ")
  }
})

var StateSaveButton = React.createClass({
  setInitialState(){
    return {
      count: 0
    };
  },
  onClick(){
    this.setState.count({ count: this.state.count + 1})
  },
  render() {
    return(
      <div>
        <span>{this.state.count}</span>
        <button onClick={this.onClick}>click</button>
      </div>
    );
  }
})

React.render(
  <StateSaveButton value="保存する" />,
  document.getElementById('content')
);
