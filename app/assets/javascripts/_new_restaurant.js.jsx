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
      restaurants: [],
      isAliasesLoading: false
    }
  },

  submitNewRestaurant (event) {
    event.preventDefault();

    if (this.state.isAliasesLoading) return;

    let firstRestaurant = this.state.restaurants[0];

    if (firstRestaurant) {
      location.href = `/restaurants/${firstRestaurant.id}`;
    } else {
      let restaurantName = this.refs.newName.value;

      $.ajax('/restaurants', {
        method: 'POST',
        data: {
          restaurant: {
            name: restaurantName
          }
        },
        success: (response) => {
          location.href = `/restaurants/${response.id}`;
        }
      });
    }
  },

  handleInput () {
    if (!this.refs.newName.value) {
      this.setState({
        restaurants: []
      });

      return;
    } else if (this.refs.newName.value === this.state.newName) {
      return;
    }

    this.setState({
      isAliasesLoading: true
    });

    return $.getJSON(`/find?name=${this.refs.newName.value}`, (response) => {
      this.setState({
        newName: this.refs.newName.value,
        restaurants: response,
        isAliasesLoading: false
      })
    });
  },

  render () {
    let autoCompleteArray = this.state.restaurants.map((alias) => {
      return <AutoComplete key={alias.id} id={alias.id} name={alias.name}/>
    });

    return <div>
    <h1 className="h3">И как же называется это чудное место?</h1>
    <form action="" className="clearfix" onSubmit={this.submitNewRestaurant}>
    <div className="col-xs-12">
     <div className="row">
       <div className="input-group">
         <input type="text"
                placeholder="Название заведения"
                defaultValue={this.state.newName}
                className="form-control"
                onKeyUp={this.handleInput} ref="newName"/>
         <span className="input-group-btn">
           {this.state.isAliasesLoading ? <i className="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i> : null}
           <button type="submit" className="btn btn-primary" disabled={this.state.isAliasesLoading}>Давайте уже есть!</button>
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