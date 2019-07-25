import React from "react"
import PropTypes from "prop-types"
import AutoResponsive from 'autoresponsive-react';
// @ts-ignore
class AutoResponsiveGrid extends React.Component {
  render() {
    console.log(AutoResponsive)
    return (
      <AutoResponsive ref="container">
        FUCK
      </AutoResponsive>
    );
  }
}

export default AutoResponsiveGrid