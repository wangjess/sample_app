import React from "react";
import PropTypes from "prop-types";
import { render } from "react-dom";
import { CircularProgressbar } from 'react-circular-progressbar';
import '../../assets/stylesheets/styles.css';
class VideoPercent extends React.Component {
  render () {
    console.log(this.props.percent);
    return (
      <div style={{"height" : "20%", "width" : "20%"}}>
        <CircularProgressbar value={this.props.percent} text={`${this.props.percent}%`} />
      </div>
    );
  }
}

export default VideoPercent