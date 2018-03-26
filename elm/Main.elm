module Main exposing (..)

import Css exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Plants exposing (..)
import Process exposing (sleep)
import Time exposing (Time, second)
import Time.DateTime as DateTime


-- MODEL


type alias Model =
    { route : Route
    , chosenPlant : Plant
    , plants : List Plant
    , date : Int
    }


type alias TimeNow =
    Time


model : Model
model =
    { route = SplashScreen
    , chosenPlant = plantDefault --shorten
    , plants = [ plant1, plant2, plant3, plant4, plant5, plant6, plant7, plant8, plant9 ]
    , date = 0
    }


type Route
    = SplashScreen
    | Home
    | AllPlants
    | UserPlants
    | ThePlant Int
    | About


type Msg
    = NoOp
    | ChangeRoute Route
    | ChangePlant Plant
    | AddToUserPlant Int
    | RemoveFromUserPlant Int
    | Tick Time



-- MAIN


main : Program Never Model Msg
main =
    -- beginnerProgram { model = model, update = update, view = view }
    program { init = ( model, Cmd.none ), update = update, view = view, subscriptions = subscriptions }



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick



-- UPDATE
-- update : Msg -> Model -> Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        -- model ! []
        ChangeRoute newRoute ->
            ( { model | route = newRoute }, Cmd.none )

        ChangePlant newPlant ->
            { model | chosenPlant = newPlant } ! []

        AddToUserPlant plantId ->
            let
                newPlants =
                    List.map
                        (\plant ->
                            if plant.id_ == plantId then
                                { plant | userFav = True }
                            else
                                plant
                        )
                        model.plants
            in
            ( { model | plants = newPlants }, Cmd.none )

        RemoveFromUserPlant plantId ->
            let
                newPlants =
                    List.map
                        (\plant ->
                            if plant.id_ == plantId then
                                { plant | userFav = False }
                            else
                                plant
                        )
                        model.plants
            in
            ( { model | plants = newPlants }, Cmd.none )

        -- TimeNow date ->
        --     ( model, Cmd.none )
        Tick newTime ->
            let
                newMonth =
                    newTime
                        -- TimeNow/Time
                        |> DateTime.fromTimestamp
                        --DateTime
                        |> Debug.log "DateTime"
                        |> DateTime.month

                -- Int
            in
            ( { model | date = newMonth }, Cmd.none )



-- ChangeRouteAndPlant newRoute newPlant ->
--     { model
--         | route = newRoute
--         , chosenPlant = newPlant
--     }


view : Model -> Html Msg
view model =
    case model.route of
        SplashScreen ->
            body [ myContainer ]
                [ div
                    [ class "test-class test-class2" ]
                    [ text "Splash Screen"
                    , br [] []
                    , button [ onClick (ChangeRoute Home) ] [ text "here I want 2s dalay and auto go Home" ]
                    , button [] [ text (toString model.date) ]
                    , ul [ myNav ]
                        [ button [ class "test-class2", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                        , button [ onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                        , button [ onClick (ChangeRoute About) ] [ text "About" ]
                        ]
                    ]
                ]

        Home ->
            body [ myContainer ]
                [ div []
                    [ text "Home Screen"
                    , br [] []
                    , button [ onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                    , br [] []
                    , button [ onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                    , br [] []
                    , button [ onClick (ChangeRoute About) ] [ text "About" ]
                    ]
                ]

        AllPlants ->
            body [ myContainer ]
                [ div []
                    [ text "Plants Screen"
                    , br [] []
                    , br [] []
                    , div []
                        (List.map
                            (\plant ->
                                div []
                                    [ br [] []
                                    , button [ onClick (ChangeRoute (ThePlant plant.id_)) ]
                                        [ text plant.name ]
                                    , br [] []
                                    ]
                            )
                            model.plants
                        )
                    , br [] []
                    , br [] []
                    , button [ onClick (ChangeRoute Home) ] [ text "Home" ]
                    ]
                ]

        UserPlants ->
            let
                userFavPlants =
                    List.filter (\plant -> plant.userFav) model.plants
            in
            body [ myContainer ]
                [ div []
                    [ text "User Plants Screen"
                    , br [] []
                    , div
                        []
                        (List.map
                            (\plant ->
                                button [ onClick (ChangeRoute (ThePlant plant.id_)) ] [ text plant.name ]
                            )
                            userFavPlants
                        )
                    , button [ onClick (ChangeRoute Home) ] [ text "Home" ]
                    ]
                ]

        ThePlant plantId ->
            let
                thePlant =
                    model.plants
                        |> List.filter (\plant -> plant.id_ == plantId)
                        |> List.head
                        |> Maybe.withDefault plantDefault

                addRemoveButton =
                    case thePlant.userFav of
                        True ->
                            -- onClick check if its in User plants
                            button [ onClick (RemoveFromUserPlant thePlant.id_) ] [ text "Remove from User Plants" ]

                        False ->
                            -- onClick check if its in User plants
                            button [ onClick (AddToUserPlant thePlant.id_) ] [ text "Add To User Plants" ]
            in
            body [ myContainer ]
                [ div []
                    [ text "The Plant"
                    , br [] []
                    , br [] []
                    , text thePlant.name
                    , addRemoveButton
                    , br [] []
                    , br [] []
                    , text "Plant Description"
                    , br [] []
                    , text thePlant.description
                    , br [] []
                    , button [ onClick (ChangeRoute Home) ] [ text "Home" ]
                    ]
                ]

        About ->
            body [ myContainer ]
                [ div []
                    [ text "About Screen"
                    , br [] []
                    , button [ onClick (ChangeRoute Home) ] [ text "Home" ]
                    ]
                ]
