import node_resolve from 'rollup-plugin-node-resolve';
import uglify from 'rollup-plugin-uglify';

export default {
  input: './lib/es6/src/main.js',
  output: {
    file: './build/index.js',
    format: 'iife'
  },
  plugins: [
    node_resolve({module: true, browser: true}),
    //uglify()
  ],
  name: 'index'
}

