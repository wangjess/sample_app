import React from "react"
import PropTypes from "prop-types"
import { CircularProgressbar } from 'react-circular-progressbar';
import 'app/assets/stylesheets/styles.css';
class Percentage extends React.Component {
  render () {
    console.log(this.props);
    return (
      <React.Fragment>
        <h1>PERCENTAGE ICON HERE:</h1>
        <p>Percentages here</p>
      </React.Fragment>
    );
  }
}

export default Percentage
