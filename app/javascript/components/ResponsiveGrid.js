import React from "react"
import PropTypes from "prop-types"
import AutoResponsive from 'autoresponsive-react';
class ResponsiveGrid extends React.Component {
  render() {
    return (
      <AutoResponsive ref="container" {...this.getAutoResponsiveProps()}>
        {
          arrayList.map(function(i) {
            return <div onClick={this.clickItemHandle} className="item" style={this.state.styleList[i]}>{i}</div>;
          }, this)
        }
      </AutoResponsive>
    );
  }
}

export default ResponsiveGrid