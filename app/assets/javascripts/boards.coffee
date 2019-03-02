# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update = ->
  url = window.location.origin + "/drink_log"
  $.get(url, (data) ->
    drink_log_table = document.getElementById('drink_log')
    drink_log_table.parentElement.innerHTML = data
  )

  url = window.location.origin + "/leader_board"
  $.get(url, (data) ->
    drink_log_table = document.getElementById('leader_board')
    drink_log_table.parentElement.innerHTML = data
  )

window.setInterval( ->
  update()
, 60000)

$ ->
  $('.bingo-button').click ->
    return if this.id.split('/')[1] == '12'
    url = window.location.origin + "/boards/" + this.id
    handle_response = (space) ->
      check_bingo = ->
        rows = document.getElementById('bingo-board').children[0].children
        i = 0
        while i < 5
          bingo = true
          j = 0
          while j < 5
            if rows[i].children[j].children[0].style.backgroundColor != 'lightgreen'
              bingo = false
            j++
          if bingo
            alert 'Bingo!'
            return
          i++

        i = 0
        while i < 5
          bingo = true
          j = 0
          while j < 5
            if rows[j].children[i].children[0].style.backgroundColor != 'lightgreen'
              bingo = false
            j++
          if bingo
            alert 'Bingo!'
            return
          i++

        bingo = true
        i = 0
        while i < 5
          if rows[i].children[i].children[0].style.backgroundColor != 'lightgreen'
            bingo = false
          i++
        if bingo
          alert 'Bingo!'
          return

        bingo = true
        i = 0
        while i < 5
          if rows[i].children[4 - i].children[0].style.backgroundColor != 'lightgreen'
            bingo = false
          i++
        if bingo
          alert 'Bingo!'
          return

      if space.style.backgroundColor == 'lightgreen'
        space.style.backgroundColor = 'white'
      else
        space.style.backgroundColor = 'lightgreen'
        check_bingo()

    $.post url, handle_response(this)
    window.setTimeout( ->
      update()
    , 1000)
