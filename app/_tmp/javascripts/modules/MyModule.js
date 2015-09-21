(function() {
  define(function(require) {
    var $, MyModule, Templates;
    $ = require('jquery');
    Templates = require('templates/templates');
    MyModule = (function() {
      function MyModule() {
        this.template = Templates['app/assets/javascripts/templates/myModule.hbs'];
        $('body').append(this.template());
        console.log('constructor: MyModule with templates');
      }

      return MyModule;

    })();
    return MyModule;
  });

}).call(this);
