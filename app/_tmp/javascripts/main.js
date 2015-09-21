(function() {
  "use strict";
  require.config({
    shim: {
      handlebars: {
        exports: "Handlebars",
        init: function() {
          this.Handlebars = Handlebars;
          return this.Handlebars;
        }
      }
    },
    paths: {
      jquery: '../../bower_components/jquery/jquery',
      handlebars: "../../bower_components/handlebars.js/dist/handlebars"
    }
  });

  require(['App'], function(App) {
    return new App;
  });

}).call(this);
