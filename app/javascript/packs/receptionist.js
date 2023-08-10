require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("@nathanvda/cocoon")

import "../js/bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import "../js/wow"
import Trix from "trix"

document.addEventListener("trix-before-initialize", () => {
  // Change Trix.config if you need
})