//var ask = "質問変数";

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
  getInitialState(){
    return {
      count: 0
    };
  },
  onClick(){
    this.setState({ count: this.state.count + 1})
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

var CountryDropdown = React.createClass({
  getInitialState() {
    return {
      showOptions: false
    };
  },
  render() {
    var options;
    if(this.state.showOptions) {
      options = <CountryOptions />
    }

    return(
      <div className="dropdown" onClick={this.handleClick}>
        <label>国名を選択してください</label>
        {options}
      </div>
    );
  },
  handleClick() {
    this.setState({ showOptions: true })
  }
})

var CountryOptions = React.createClass({
  render() {
    return(
      <div className="country-option">
        <p>日本</p>
        <p>中国</p>
        <p>アメリカ</p>
        <p>ロシア</p>
      </div>
    );
  }
})

var User = React.createClass({
  // propTypes() {
  //   name: React.PropTypes.isRequired,
  //   id: React.PropTypes.number.isRequired
  // },
  propTypes: {
    name: React.PropTypes.string.isRequired,
    id:   React.PropTypes.number.isRequired
  },
  render() {
    return(
      <div>{this.props.id} : {this.props.name}</div>
    );
  }
});

//var request = require('superagent')

var Users = React.createClass({
  getInitialState() {
    return {
      users: [ {id: 1, name: "foo"}, {id: 2, name: "bar"}]
    }
  },

  componentDidMount() {
    request.get('http://example.com/users/', (res) => {
      this.setState({users: res.body.users});
    })
  },
  render() {
    var users = this.state.users.map((user) => {
      return <User id={user.id} name={user.name} key={user.id} />
    });
    return (
      <div>
          <p>ユーザー一覧</p>
          {users}
      </div>
    );
  }
});

//子でのイベントを親でハンドリングする

var Todo = React.createClass({
  propTypes: {
    todo: React.PropTypes.shape({
      id: React.PropTypes.number.isRequired,
      text: React.PropTypes.string.isRequired
    }),
    //削除するための処理をI/Fとして定義しておく
    onDelete: React.PropTypes.func.isRequired
  },
  //親に処理を委譲する
  _onDelete() {
    this.props.onDelete(this.props.todo.id)
  },
  render() {
    return(
      <div>
          <span>{this.props.todo.text}</span>
          <button onClick={this._onDelete}>削除する</button>
      </div>
    );
  }
})

var TodoList = React.createClass({
  getInitialState() {
    return {
      todos: [
        { id: 1, text: "advent calendar1" },
        { id: 2, text: "advent calendar2" },
        { id: 3, text: "advent calendar3" }
      ]
    }
  },
  //TodoListはこのComponentが管理しているので削除する処理もここにあるべき
  deleteTodo(id) {
    this.setState({
      todos: this.state.todos.filter((todo) => {
        return todo.id !== id
      })
    });
  },
  render() {
    var todos = this.state.todos.map((todo) => {
      return <li key={todo.id}><Todo onDelete={this.deleteTodo} todo={todo} /></li>;
    });
    return <ul>{todos}</ul>;
  }
})

//refの使い方　親から子のメソッドを呼べたりするようになるが、Component間の関係がわかりにくくなるので基本的にdivやbuttonなどの組み込みComponentに対して使うもの
var RefTest = React.createClass({
  componentDidMount() {
    console.log(this.refs.myDiv.props.children); //hogehoge
  },
  render() {
    return(
        <div ref="myDiv">hogehoge</div>
    );
  }
})

//直接DOMNodeを触りたいときはgetDOMNode()を使うといいが、これで変更すると整合性が崩れるので読み取り専用にしたほうがいい

var Focus = React.createClass({
  componentDidMount() {
    this.refs.myText.getDOMNode().focus();
  },
  render() {
    return(
      <div>
          <p>aiueo</p>
          <input type="text" ref="myText" />
      </div>
    );
  }
})

//React.jsでフォームを扱う
//Stateによって値を管理するControlled Componentを作らなあかん

var InputText = React.createClass({
  getInitialState() {
    return {
      textValue: "初期状態だよ！"
    };
  },
  changeText(e) {
    this.setState({ textValue: e.target.value});
  },
  render() {
    return(
      <div>
        <p>{this.state.textValue}</p>
        <input type="text" value={this.state.textValue} onChange={this.changeText} />
      </div>
    );
  }
})

//selectbox
// var SelectBox = React.createClass({
//   getDefaultProps() {
//     return {
//       answers: [1, 10, 100, 1000]
//     };
//   },
//   getInitialState() {
//     return {
//       selectValue: 1,
//       selectValues: [1, 100]
//     }
//   },
//   onChangeSelectValue(e) {
//     this.setState({ selectValue: e.target.value})
//   },
//   onChangeSelectValues(e) {
//     debugger;
//     var values = _.chain(e.target.options)
//       .filter(function(option) { return option.selected })
//       .map(function(option) { return +option.value })
//       .value()
//     ;
//     this.setState({selectValues: values});
//   },
//   render() {
//     var options = this.props.answers.map(function(answer){
//         return <option value={answer} key={answer}>{answer}</option>;
//     });
//     return (
//         <div>
//             <div>selectValue: {this.state.selectValue} </div>
//             <div>
//                 <select value={this.state.selectValue} onChange={this.onChangeSelectValue} >
//                     {this.state.selectValue}
//                 </select>
//             </div>
//             <div>selectValues: {this.state.selectValues.join(',')}</div>
//             <div>
//                 <select multiple={true} defaultValue={this.state.selectValues} onChange={this.onChangeSelectValues} >
//                   {options}
//                 </select>
//             </div>
//         </div>
//     );
//   }
// })


// var LinkedStateMixin = React.createClass({
//   mixins: [React.addons.LinkedStateMixin],
//   getInitialState() {
//     return {
//       textValue: "initial value"
//     }
//   },
//   render() {
//     return (
//       <div>
//         <div>value: {this.state.textValue}</div>
//         <input type="text" valueLink={this.linkState('textValue')} />
//       </div>
//     );
//   }
// });

var KeySample = React.createClass({
    getInitialState() {
        return {
          list: [1, 2, 3, 4, 5]
        };
    },
    add() {
      this.setState({ list: [0].concat(this.state.list)});
    },
    render() {
      var list = this.state.list.map(function(i) { return <li>{i}</li> });
      return (
        <div>
          <ul>{list}</ul>
          <button onClick={this.add}>add</button>
        </div>
        );
    }
});

var MyForm = React.createClass({
    submitHandler(e) {
      e.preventDefault();
      var helloTo = React.findDOMNode(this.refs.helloTo).value;
      alert(helloTo);
    },
    render() {
        return (
          <form onSubmit={this.submitHandler}>
              <input type="text" defaultValue="Hello World!"  ref="helloTo"/>
              <button type="submit">送信</button>
          </form>
        );
    }
});

var ChangeStyle = React.createClass({
    getInitialState() {
        return{
            style: {
                color: "#CCC",
                width: 200,
                height: 100
            }
        }
    },
    onChange() {
        var style =  { style: {
            color: "#CCC",
            width: 200,
            height: 100
            }
        };
        style.color = "#000";
        this.setState({style: style});
    },
    render() {
      return(
          <div style={this.state.style} onClick={this.onChange} >色が変わるよー</div>
      );

    }
});

var classSet = React.addons.classSet;

var KlassSet = React.createClass({
    getInitialState() {
        return{
            isWarning: false,
            isImportant: false
        };
    },
    toggleWarning() {
        setState({ isWarning: !this.state.isWarning });
    },
    toggleImportant() {
        setState({ isImportant: !this.state.isImportant });
    },
    render() {
      var style = classSet({
          'is-warning': this.state.isWarning,
          'is-important': this.state.isImportant
      });
      return (
          <div>
              <button onClick={this.toggleWarning}> warning </button>
              <button onClick={this.toggleImportant}>important</button>
              <p className={style}>ほげほげ</p>
          </div>
      );
    }
});

//ReactでCSSアニメーション

var CSSTransitionGroup = React.addons.CSSTransitionGroup;

var CSSAnime = React.createClass({
  getInitialState() {
    return {
      value: '(´・ω・｀)'
    };
  },
  onClick() {
    var value = this.state.value === '(´・ω・｀)' ? '(｀･ω･´)ゞ' : '(´・ω・｀)';
    this.setState({ value: value });
  },
  render() {
    var value = <span className="sample" key={this.state.value}>{this.state.value}</span>;
    return (
      <div>
        <div>Animation!!<button onClick={this.onClick}>click!!</button></div>
        <CSSTransitionGroup transitionName="sample">
          {value}
        </CSSTransitionGroup>
      </div>
    );
  }
});

//requestAnimationFrameを使ったアニメーション
var Positioner = React.createClass({
    getInitialState() {
        return { position: 0 };
    },
    resolveAnimationFrame() {
        var timestamp = new Date();
        var timeRemaining = Math.max(0, this.props.animationCompleteTimestamp - timestamp);

        if (timeRemaining > 0) {
            this.setState({ position: timeRemaining});
        }
    },

    componentWillUpdate() {
        if (this.props.animationCompleteTimestamp) {
          requestAnimationFrame(this.resolveAnimationFrame);
        }
    },

    render() {
        var divStyle = {left: this.state.position};

        return <div style={divStyle}>この要素が動く</div>
    }
});

React.render(
  < CSSAnime />,
  document.getElementById('content')
);
