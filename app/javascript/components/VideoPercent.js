import React from "react";
import PropTypes from "prop-types";
import { CircularProgressbar } from 'react-circular-progressbar';
import '../../assets/stylesheets/styles.css';
class VideoPercent extends React.Component {
  render () {
    console.log(this.props.percent);
    return (
      <React.Fragment>
        <CircularProgressbar value={this.props.percent} text={`${this.props.percent}%`} />
      </React.Fragment>
    );
  }
}

export default VideoPercent