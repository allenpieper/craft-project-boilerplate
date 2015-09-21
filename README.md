# Craft CMS Project Boilerplate

This is the project scaffolding we use at [MilesHerndon] for all of our Craft CMS projects.  

### Requirements
* [Node.js]
* [Grunt] - `` $ npm install -g grunt-cli ``
* [Bower] - `` $ npm install -g bower ``

### Under the Hood
This project scaffolding is pretty opinionated and makes use of the following tools, open source projects, and architecture methodologies:

* [Require.js] - JavaScript file and module loader
* [Sass] - CSS extension language
* [CoffeeScript] - Language that transcompiles to JavaScript
* [SMACSS] - Methodology for organizing scalable and modular CSS architectures
* [svg4everybody] - Open source external SVG polyfill
* [PictureFill] - Open source picture element polyfill

### Starting a Project

Download or clone this project scaffold into your working directory, and then run:

```sh
$ npm install
$ bower install
```

Your project is now fully set up. You have two Grunt tasks in your Gruntfile: `` $ grunt `` for development and `` $ grunt build `` for project compilation. 

After running `` $ grunt build ``, your deploy-ready code will be located in the ``/dist/`` directory of your project.

   [MilesHerndon]: <https://milesherndon.com>
   [Node.js]: <https://nodejs.org/en/>
   [Grunt]: <http://gruntjs.com/>
   [Bower]: <http://bower.io/>
   [Require.js]: <http://requirejs.org/>
   [Sass]: <http://sass-lang.com/>
   [CoffeeScript]: <http://coffeescript.org/>
   [SMACSS]: <https://smacss.com/>
   [svg4everybody]: <https://github.com/jonathantneal/svg4everybody>
   [PictureFill]: <https://github.com/scottjehl/picturefill>

