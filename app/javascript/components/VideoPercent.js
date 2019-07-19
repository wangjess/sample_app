import React from "react";
import PropTypes from "prop-types";
import { CircularProgressbar } from 'react-circular-progressbar';
import '../../assets/stylesheets/styles.css';
class VideoPercent extends React.Component {
  render () {
    console.log("HEY YOU YOU SHOULD SEE THIS IN CONSOLE IF REACT COMPONENT WORKS")
    console.log(this.props);
    return (
      <React.Fragment>
        <h1>PERCENTAGE ICON HERE:</h1>
        <p>Percentages here</p>
        <CircularProgressbar value={this.props} text={`${this.props}%`} />;
      </React.Fragment>
    );
  }
}

export default VideoPercent