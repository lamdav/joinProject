var React = require("react");
var NavItem = require("./NavItem.jsx");

var NavBar = React.createClass({
  render: function() {
    var navStyle = {
      WebkitBoxShadow: "0 0 4px rgba(0, 0, 0, 0.4)",
      MozBoxShadow: "0 0 0 4px rgba(0, 0, 0, 0.4)",
      boxShadow: "0 0 0 4px rgba(0, 0, 0, 0.4)",
      textShadow: "0 -1px 0 rgba(0,0,0,.15)",
      borderRadius: 0,
    };

    var titleStyle = {};

    var linkStyle = {};

    // Optional Props
    if (this.props.bgColor) {
      navStyle.background = this.props.bgColor;
    };

    if (this.props.titleColor) {
      titleStyle.color = this.props.titleColor;
    };

    if (this.props.linkColor) {
      linkStyle.color = this.props.linkColor;
    };

    var createLinkItem = function(item, index) {
      return (
        <NavItem linkStyle = {linkStyle} key = {item.title + index} href = {item.href} title = {item.title} />
      );
    };

    return (
      <div>
        <nav style = {navStyle} className = "navbar navbar-default navbar-fixed-top">
          <div className = "navbar-header">

            {/*Navbar collapsable button*/}
            <button type = "button" className = "navbar-toggle" data-toggle = "collapse" data-target = "#nav-collapse">
              <span className = "icon-bar"></span>
              <span className = "icon-bar"></span>
              <span className = "icon-bar"></span>
            </button>

            {/*Branding image*/}
            <a style = {titleStyle} className = "navbar-brand" href = "#"> {this.props.brandName} </a>
          </div>

          {/*Collapsed Items*/}
          <div className = "collapse navbar-collapse" id = "nav-collapse">
            <ul className = "nav navbar-nav nav-pills">
              {this.props.navData.map(createLinkItem)};
            </ul>

            {/*Search*/}
            {/*TODO: Make search components*/}
            <div>
              <form className ="navbar-form navbar-right">
                <div className ="form-group">
                  <input type="text" className ="form-control" placeholder="Search" />
                </div>

                <button type="submit" className ="btn btn-default">Submit</button>
              </form>
            </div>
          </div>

        </nav>
      </div>
    );
  }
});

module.exports = NavBar;