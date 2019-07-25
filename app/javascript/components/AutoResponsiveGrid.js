import React from "react"
import PropTypes from "prop-types"
import AutoResponsive from 'autoresponsive-react';
class AutoResponsiveGrid extends React.Component {
  render() {
    return (
      <AutoResponsive ref="container">
      </AutoResponsive>
    );
  }
}

export default AutoResponsiveGrid