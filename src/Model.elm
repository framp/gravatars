module Model exposing (..)

import Set exposing (Set)

type alias Email = String
type alias App = (Email, Bool, Set Email)
type alias Flags = (Bool, List Email)

type Msg = 
  InsertEmail Email |
  RemoveEmail Email |
  UpdateEmail Email