require.config
  paths:
    jquery: "../bower_components/jquery/jquery"
    pixi: "../bower_components/pixi/bin/pixi"
    bootstrapAffix: "../bower_components/sass-bootstrap/js/affix"
    bootstrapAlert: "../bower_components/sass-bootstrap/js/alert"
    bootstrapButton: "../bower_components/sass-bootstrap/js/button"
    bootstrapCarousel: "../bower_components/sass-bootstrap/js/carousel"
    bootstrapCollapse: "../bower_components/sass-bootstrap/js/collapse"
    bootstrapDropdown: "../bower_components/sass-bootstrap/js/dropdown"
    bootstrapModal: "../bower_components/sass-bootstrap/js/modal"
    bootstrapPopover: "../bower_components/sass-bootstrap/js/popover"
    bootstrapScrollspy: "../bower_components/sass-bootstrap/js/scrollspy"
    bootstrapTab: "../bower_components/sass-bootstrap/js/tab"
    bootstrapTooltip: "../bower_components/sass-bootstrap/js/tooltip"
    bootstrapTransition: "../bower_components/sass-bootstrap/js/transition"

  shim:
    bootstrapAffix:
      deps: ["jquery"]

    bootstrapAlert:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapButton:
      deps: ["jquery"]

    bootstrapCarousel:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapCollapse:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapDropdown:
      deps: ["jquery"]

    bootstrapModal:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapPopover:
      deps: ["jquery", "bootstrapTooltip"]

    bootstrapScrollspy:
      deps: ["jquery"]

    bootstrapTab:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapTooltip:
      deps: ["jquery", "bootstrapTransition"]

    bootstrapTransition:
      deps: ["jquery"]

require ["utils/Game", "world/Stage", "characters/OctoBall", "utils/Counter"], (Game, Stage, OctoBall, Counter) ->
  "use strict"
  
  stage = new Stage()
  stage.onClick -> octocats.push stage.addChildCentered(new OctoBall())

  document.getElementById("game").appendChild stage.view()

  octocats = [ stage.addChildCentered new OctoBall() ]

  ballsCounter = new Counter octocats, "OctoBalls: "
  stage.addChild ballsCounter

  new Game( -> stage.render()).start()
