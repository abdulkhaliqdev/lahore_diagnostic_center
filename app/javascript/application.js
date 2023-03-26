// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "./jquery"
import "./js/typed"
import "./jquery_ui"
import "./jquery.singlePageNav.min.js"
import "./js/custom"
import "./popper"
import "./bootstrap"
import "./js/site"
import "wow"



$(function() { $('body').scrollspy({ target: '.navbar-fixed-top', offset: 80 }); });