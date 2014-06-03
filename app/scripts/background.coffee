"use strict"

chrome.webRequest.onCompleted.addListener(
  (info) ->
    # Send a message to the content script
    chrome.tabs.sendMessage info.tabId, "notification api has called"
  urls: [
      "*://qiita.com/api/notifications/count",
      "*://*.qiita.com/api/notifications/count"
  ]
)
