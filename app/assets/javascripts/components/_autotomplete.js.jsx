var AutoComplete = React.createClass({
  render () {
    return <a className="list-group-item" data-id={this.props.id} href={`/restaurants/${this.props.id}`}>{this.props.name}</a>
  }
});