module Msg exposing (..)

import Model exposing (Route)
import Plants exposing (Plant)
import Time exposing (Time)


type Msg
    = NoOp
    | ChangeRoute Route
    | ChangePlant Plant
    | AddToUserPlant Int
    | RemoveFromUserPlant Int
    | Tick Time
    | PlantMessaeges
