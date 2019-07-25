import React from "react"
import PropTypes from "prop-types"
// Most of react-virtualized's styles are functional (eg position, size).
// Functional styles are applied directly to DOM elements.
// The Table component ships with a few presentational styles as well.
// They are optional, but if you want them you will need to also import the CSS file.
// This only needs to be done once; probably during your application's bootstrapping process.
import 'react-virtualized/styles.css'
 
// You can import any component you want as a named export from 'react-virtualized', eg
import { Column, Table } from 'react-virtualized'
 
// But if you only use a few react-virtualized components,
// And you're concerned about increasing your application's bundle size,
// You can directly import only the components you need, like so:
import AutoSizer from 'react-virtualized/dist/commonjs/AutoSizer'
import List from 'react-virtualized/dist/commonjs/List'
class ReactGrids extends React.Component {
  render () {
    return (
      <React.Fragment>
        HELLO BITCH 
      </React.Fragment>
    );
  }
}

export default ReactGrids
