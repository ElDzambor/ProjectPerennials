module Model exposing (..)

import Plants exposing (..)


type alias Model =
    { route : Route
    , chosenPlant : Plant
    , plants : List Plant
    , date : Int
    }


type Route
    = SplashScreen
    | Home
    | AllPlants
    | UserPlants
    | ThePlant Int
    | About
