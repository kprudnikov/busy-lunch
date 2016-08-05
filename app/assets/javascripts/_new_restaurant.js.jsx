var NewRestaurant = React.createClass({
  componentWillMount () {
    console.log('WILL MOUNT');
    this.handleInput = _.debounce(this.handleInput, 300);
  },

  componentDidMount () {
    // return $.getJSON('api/v1/items.json', (response) => {this.setState({items: response}) })
    console.log('MOUNTED');
  },

  getInitialState () {
    console.log('INIT STATE');
    return {
      newName: "",
      aliases: []
    }
  },

  submitNewRestaurant (event) {
    console.log('submitNewRestaurant');
    event.preventDefault();
  },

  handleInput (event) {
    if (!this.refs.newName.value) {
      this.setState({
        aliases: []
      });

      return;
    };

    return $.getJSON(`/find?name=${this.refs.newName.value}`, (response) => {
      console.log(response);
      this.setState({
        newName: this.refs.newName.value,
        aliases: response
      })
    });
  },

  render () {
    let autoCompleteArray = this.state.aliases.map((alias) => {
      return <AutoComplete key={alias.id} id={alias.id} name={alias.name}/>
    });

    return <div>
      <h1 className="h3">И как же называется это чудное место?</h1>
      <form action="" className="clearfix">
       <div className="col-xs-12">
         <div className="row">
           <div className="input-group">
             <input type="text" className="form-control" placeholder="Название заведения" defaultValue={this.state.newName} onKeyUp={this.handleInput} ref="newName"/>
             <span className="input-group-btn">
               <button type="submit" className="btn btn-primary" onClick={this.submitNewRestaurant}>Давайте уже есть!</button>
             </span>
           </div>
         </div>
       </div>
      </form>
      <ul className="list-group">
        {autoCompleteArray}
      </ul>
  </div>
  }
});