# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@4.6.0/dist/js/bootstrap.js"
pin "jquery", to: "jquery-3.1.1.min.js", preload: true
pin "pace", to: "pace.min.js", preload: true
pin "peity", to: "jquery.peity.min.js", preload: true
pin "slimscroll", to: "jquery.slimscroll.min.js", preload: true
pin "metismenu", to: "jquery.metisMenu.js", preload: true
pin "popper.js", to: "https://ga.jspm.io/npm:popper.js@1.16.1/dist/umd/popper.js"
pin "ajax", to: "https://ga.jspm.io/npm:ajax@0.0.4/lib/ajax.js"
pin "underscore", to: "https://ga.jspm.io/npm:underscore@1.13.6/modules/index-all.js"
pin "wow", to: "https://ga.jspm.io/npm:wow@0.0.6/lib/main.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/crypto.js"
pin "dns", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/dns.js"
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/events.js"
pin "filed", to: "https://ga.jspm.io/npm:filed@0.0.7/main.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/fs.js"
pin "http", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/http.js"
pin "mime", to: "https://ga.jspm.io/npm:mime@1.2.7/mime.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/path.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "stream", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/stream.js"
pin "url", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/url.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/util.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.3.0/js/fontawesome.js"
pin "@fortawesome/fontawesome-svg-core", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.3.0/index.mjs"
pin "@fortawesome/free-brands-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.3.0/index.mjs"
pin "@fortawesome/free-regular-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-regular-svg-icons@6.3.0/index.mjs"
pin "@fortawesome/free-solid-svg-icons", to: "https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.3.0/index.mjs"
