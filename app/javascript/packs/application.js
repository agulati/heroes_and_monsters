require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")

require("../stylesheets/main.scss")

$(function () {
  $(".attacker-card").on("click", function () {
    var unSelecting = $(this).hasClass("selected")
    $(".attacker-card").removeClass("selected")

    if( unSelecting ) {
      window.attackerFighter = null
      $(".confirmation-message").html("You must select an attacker and defender to continue.")
    } else {
      $(this).addClass("selected")
      window.attackerFighter = $(".attacker-card.selected .warrior-name").text().trim()
      $(".confirmation-message").html(window.attackerFighter + " will attack " + window.defenderFighter + ".")
    }
  })

  $(".defender-card").on("click", function () {
    var unSelecting = $(this).hasClass("selected")
    $(".defender-card").removeClass("selected")

    if( unSelecting ) {
      window.defenderFighter = null
      $(".confirmation-message").html("You must select an attacker and defender to continue.")
    } else {
      $(this).addClass("selected")
      window.defenderFighter = $(".defender-card.selected .warrior-name").text().trim()
      $(".confirmation-message").html(window.attackerFighter + " will attack " + window.defenderFighter + ".")
    }
  })

  $("#confirmAttack").on("click", function () {
    $("#attackerField").val(window.attackerFighter)
    $("#defenderField").val(window.defenderFighter)
    $("audio")[0].play()
    setTimeout(function () { $("#attackForm").submit() }, 2000)
  })
})
