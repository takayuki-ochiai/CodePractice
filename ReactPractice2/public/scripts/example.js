/**@jsx React.DOM*/

// ToDoListの子コンポーネント。親からもらったデータを、変化させることができないpropsという状態でうけとる
var ToDo = React.createClass({
  render: function() {
    var defaultClass = 'callout';

    defaultClass += this.props.done ? ' callout-success' : ' callout-info';
    return (
      <div className={defaultClass}>
        <i className='ficon ficon-checkmark mark-done' onClick={this.props.onClickDone}></i>
        <span onClick={this.props.onClickDone}>{this.props.value}</span>
        <i className='close' onClick={this.props.onClickClose}>&times;</i>
      </div>
    )
  }
});

// 親コンポーネント。アプリ上で変化させることができるデータをstateとして持っている。
// 親は上で定義したToDoを子供コンポーネントとしてもっている。
// 親は自分のもっているpropsやstateを子供に渡してあげることができる
var ToDoList = React.createClass({


  addTodo: function() {
    var todos = this.state.todos;

    todos.push({
      value: this.state.inputValue,
      done: false
    });
    // stateを更新するときは、かならずsetStateを使って自分で更新しないといけない。
    // setStateをしないとrenderメソッドが呼ばれないため
    this.setState({
      todos: todos,
      inputValue: ''
    });

    // Return false for form
    return false;
  },
  handleChange: function(e) {
    this.setState({
      inputValue: e.target.value
    });
  },
  removeTodo: function(index) {
    this.state.todos.splice(index, 1);

    this.setState({
      todos: this.state.todos
    });
  },
  markTodoDone: function(index) {
    var todos = this.state.todos.map(function(todo, todo_index) {
      if (index === todo_index) {
        todo.done = !todo.done
      }
      return todo
    })
    this.setState({
      todos: todos
    });
  },

  // コンポーネント内でStateの初期値を定義する関数
  getInitialState: function() {
    return {
      todos: [
        { value:'ご飯食べる', done: false },
        { value:'アニメ見る', done: false },
        { value:'漫画を大人買いする（蒼き鋼のアルペジオが面白すぎたのが悪い）', done: false },
        { value:'あっ発表資料作るのわすれてました（明日から本気出す）', done: true }
      ]
    }
  },

  // もっているstateや受け取ったpropsをもとにHTMLをレンダリングするメソッド
  // 初期表示のタイミングやstateがsetStateで書き換えられたりしてもっているデータや受け取ったデータが
  // 変更されたときに呼ばれる。
  // stateが変更されても、自分が使っていないstateやpropsの変更の場合は呼ばれない
  render: function() {


    // todos: [
    //   { value:'ご飯食べる', done: false },
    //   { value:'アニメ見る', done: false },
    //   { value:'あっ勉強するのわすれてました（見なかったことにしよう）', done: true }
    // ]
    var todos = this.state.todos.map(function(todo, index) {
      return (
        <ToDo
        key={index}
        value={todo.value}
        done={todo.done}
        onClickClose={this.removeTodo.bind(this, index)}
        onClickDone={this.markTodoDone.bind(this, index)}
      /> );
    }.bind(this));

    return (
      <div className='container'>
        <div className='col-xs-6 col-xs-offset-3'>
          <h1>おれのとぅーどぅー</h1>
          {todos}
          <form
            className='form-inline todo-form col-xs-8 col-xs-offset-2'
            role='form'
            onSubmit={this.addTodo}>
            <div className='input-group'>
              <label className='sr-only' htmlFor='todoInput'></label>
              <input type='text' value={this.state.inputValue}
                onChange={this.handleChange}
                className='form-control'
                placeholder='なんかいれるといいよ'
              />
              <span className='input-group-btn'>
                <button className='btn btn-default'>追加</button>
              </span>
            </div>
          </form>
        </div>
      </div>
    );
  }
});

React.renderComponent(ToDoList(), document.getElementById('main'));
