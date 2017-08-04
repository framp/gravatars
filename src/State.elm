port module State exposing (..)

import Set exposing (Set, fromList, insert, remove)
import Model exposing (..)

init : Flags -> (App, Cmd Msg)
init (edit, emails) = (("", edit, fromList emails), Cmd.none)

update : Msg -> App -> (App, Cmd Msg)
update msg (current, edit, emails) =
    case msg of
      InsertEmail email -> ((current, edit, insert email emails), Cmd.none)
      RemoveEmail email -> ((current, edit, remove email emails), Cmd.none)
      UpdateEmail email -> ((email, edit, emails), Cmd.none)

subscriptions : App -> Sub Msg
subscriptions model = Sub.none
