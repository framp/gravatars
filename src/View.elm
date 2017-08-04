module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, src, href, target, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)
import MD5 exposing (hex)
import Set exposing (Set, toList, size)
import String exposing (trim, toLower, join)
import Model exposing (..)

gravatarUrl : String -> String
gravatarUrl = 
  let template hash = "https://www.gravatar.com/avatar/" ++ hash ++ "?s=256"
  in template << hex << toLower << trim

makeHashUrl : Bool -> Set Email -> String
makeHashUrl edit = 
  let prefix = if edit then "#_" else "#$" 
  in ((++) prefix) << (join ",") << Set.toList

view : App -> Html Msg
view (current, edit, emails) =
  div [ class "container" ] <|
    [ div [ class "emails" ] <| (List.map (viewEmail edit) <| Set.toList emails) ++
    if Set.size emails == 0 then [ viewEmail edit ""] else [] ] ++
    if edit then [ 
      form [ class "add", onSubmit <| InsertEmail current ] [
        div [] [
          input [ placeholder "gravatar@email.com", onInput UpdateEmail ] [],
          button [ onClick <| InsertEmail current ] [ text "✓" ] ], 
        div [] [ text "Insert a gravatar email" ],
        div [] [
          a [ target "_blank", href <| makeHashUrl True emails ] [ text "Edit Link" ],
          a [ target "_blank", href <| makeHashUrl False emails ] [ text "Show Link" ] ]
      ] ] 
    else []

viewEmail : Bool -> Email -> Html Msg
viewEmail edit email = 
  div [ class "email" ] <| 
    [ img [ src <| gravatarUrl email ] [] ] ++ 
    if edit then [ a [ onClick <| RemoveEmail email ] [ text "×" ] ] 
    else []