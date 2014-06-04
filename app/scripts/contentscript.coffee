"use strict"

favicon = null

init = ->
  # Remove redudant icons
  ico = document.querySelector("link[rel='shortcut icon']")
  if ico && ico.parentNode
    ico.parentNode.removeChild ico

  touch_icon = document.querySelector("link[rel='apple-touch-icon']")
  if touch_icon && touch_icon.parentNode
    touch_icon.parentNode.removeChild touch_icon

  favicon = new Favico
    animation: 'popFade'

  updateFavicon()

chrome.runtime.onMessage.addListener(
  (request, sender, sendResponse) ->
    updateFavicon()
)

updateFavicon = ->
  cnt = document.getElementsByClassName('js-globalNotification_count')[0].innerHTML
  favicon.badge cnt

init()
