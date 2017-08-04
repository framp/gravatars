module App exposing (main)

import Html
import Model exposing (Flags, App, Msg)
import State exposing (init, update, subscriptions)
import View exposing (view)


main : Program Flags App Msg
main = 
  Html.programWithFlags
      { init = init
      , update = update
      , subscriptions = subscriptions
      , view = view }


