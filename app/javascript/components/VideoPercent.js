import React from "react";
import PropTypes from "prop-types";
import { CircularProgressbar } from 'react-circular-progressbar';
import '../../assets/stylesheets/styles.css';
class VideoPercent extends React.Component {
  render () {
    console.log("HEY BUTT FUCK")
    console.log(this.props);
    return (
      <React.Fragment>
        console.log("HELLO")
        <h1>PERCENTAGE ICON HERE:</h1>
        <p>Percentages here</p>
        <CircularProgressbar value={this.props} text={`${percentage}%`} />;
      </React.Fragment>
    );
  }
}

export default VideoPercent
