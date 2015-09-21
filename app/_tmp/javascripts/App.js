(function() {
  define(function(require) {
    var $, App, MyModule;
    $ = require('jquery');
    MyModule = require('modules/MyModule');
    App = (function() {
      function App() {
        var myModule;
        myModule = new MyModule();
        console.log('created: MyModule');
      }

      return App;

    })();
    return App;
  });

}).call(this);
