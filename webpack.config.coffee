webpack= require "webpack"
path= require "path"
env= process.env
host  = env.npm_config_host ? "localhost"
port  = env.npm_config_port ? "8080"
env   = env.NODE_ENV        ? "development"


module.exports=
  devtool: "inline-source-map"
  resolve: 
    modules: [path.resolve("src"), "node_modules"]
    alias:
      vue: path.resolve("node_modules/vue/dist/vue.esm.js")
      vuex: path.resolve("node_modules/vuex/dist/vuex.esm.js")
  entry:
    index: ["index.coffee"]
  output: path: path.resolve("__bundled_"), filename: "[name].js", publicPath: "http://#{host}:#{port}/"
  devServer: {host, port}
  module:
    rules: [
      { test: /\.coffee$/, loader: "coffee-loader"}
      { test: /\.pug$/, loader: "pug-loader"}
      { test: /\.js$/, exclude: /node_modules/, loader: 'babel-loader'},
      { test: /\.vue$/, loader: 'vue-loader' },
      { test: /\.css$/, loader: "css-loader"}
    ]
  plugins:[
    new webpack.DefinePlugin
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
    new webpack.ProvidePlugin
      _: "underscore"
    new (require "html-webpack-plugin")
      template: "src/template.pug"
      filename: "index.html", inject: off, env: env

  ]
