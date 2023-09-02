require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("@nathanvda/cocoon")

import "../js/bootstrap.js"
import "@fortawesome/fontawesome-free/js/all"
import "../js/wow"

$(document).ready(function () {
  const menuToggle = $("#menu-toggle");
  
  function toggleMenu() {
    const sidebar = $("#layout-menu");

    if (sidebar.hasClass("inverce-sidebar-menu")) {
      sidebar.removeClass("inverce-sidebar-menu");
      sidebar.addClass("sidebar-menu");
    } else {
      sidebar.removeClass("sidebar-menu");
      sidebar.addClass("inverce-sidebar-menu");
    }
  }

  // Initial check for screen width on page load
  if ($(window).width() <= 768) {
    menuToggle.on("click", function (event) {
      event.preventDefault();
      toggleMenu();
    });
  }
});



import Trix from "trix"

document.addEventListener("trix-before-initialize", () => {});
