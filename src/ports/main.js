var emails = location.hash.substring(2).split(',').filter(Boolean).map(decodeURIComponent)
var edit = location.hash[1] !== '$'
var app = Elm.App.fullscreen([edit, emails])