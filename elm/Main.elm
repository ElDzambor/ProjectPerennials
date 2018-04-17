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
            body [ class "splashScreenBody" ]
                [ div []
                    [ text "Splash Screen"
                    , br [] []
                    , button [ onClick (ChangeRoute Home) ] [ text "here I want 2s dalay and auto go Home" ]
                    , button [] [ text (toString model.date) ]
                    ]
                ]

        Home ->
            body [ class "homeScreenBody" ]
                [ div []
                    [ text "Home Screen"
                    , br [] []
                    , button [ class "homeAllPlantsButton", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                    , br [] []
                    , button [ class "homeUserPlantsButton", onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                    , br [] []
                    , button [ class "homeAboutButton", onClick (ChangeRoute About) ] [ text "About" ]
                    ]
                ]

        AllPlants ->
            body [ class "allPlantsScreenBody" ]
                [ div []
                    [ text "Plants Screen"
                    , br [] []
                    , br [] []
                    , div []
                        (List.map
                            (\plant ->
                                let
                                    imgPlantClass =
                                        case plant.type_ of
                                            Strawberry ->
                                                "Strawberry-bg"

                                            Peaches ->
                                                "Peaches-bg"

                                            Grapes ->
                                                "Grapes-bg"

                                            Echinacea ->
                                                "Echinacea-bg"

                                            Sage ->
                                                "Sage-bg"

                                            Lavender ->
                                                "Lavender-bg"

                                            Papaver ->
                                                "Papaver-bg"

                                            GeraniumM ->
                                                "GeraniumM-bg"

                                            GeraniumH ->
                                                "GeraniumH-bg"

                                            TestPlant ->
                                                "TestPlant-bg"

                                    otherClasses =
                                        "allPlantsPlantButton"

                                    allPlantsClassesButton =
                                        otherClasses ++ " " ++ imgPlantClass
                                in
                                div []
                                    [ br [] []
                                    , button [ class allPlantsClassesButton, onClick (ChangeRoute (ThePlant plant.id_)) ]
                                        [ text plant.name ]
                                    , br [] []
                                    ]
                            )
                            model.plants
                        )
                    , br [] []
                    , br [] []
                    , ul [ class "navBar" ]
                        [ button [ class "allPlantsAllPlantsButton", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                        , button [ class "allPlantsrPlantsButton", onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                        , button [ class "allPlantsAboutButton", onClick (ChangeRoute About) ] [ text "About" ]
                        ]
                    ]
                ]

        UserPlants ->
            let
                userFavPlants =
                    List.filter (\plant -> plant.userFav) model.plants
            in
            body [ class "userPlantsScreenBody" ]
                [ div []
                    [ text "User Plants Screen"]
                    , br [] []
                    , br [] []
                    , br [] []
                    , ul [ class "navBar" ]
                        [ button [ class "userPlantsPlantsButton", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                        , button [ class "userPlantsPlantsButton", onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                        , button [ class "userPlantsAboutButton", onClick (ChangeRoute About) ] [ text "About" ]
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
            body [ class "thePlantScreenBody" ]
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
                    , div []
                      [let
                        viewMonth month plantType =
                           case month of
                            Unexpected ->
                                    case plantType of
                                        Strawberry -> div [] [ text staticPlantMessages.strawberry.unexpected ]
                                        Peaches -> div [] [ text staticPlantMessages.peaches.unexpected ]
                                        Grapes-> div [] [ text staticPlantMessages.grapes.unexpected ]
                                        Echinacea -> div [] [ text staticPlantMessages.echinacea.unexpected ]
                                        Sage -> div [] [ text staticPlantMessages.sage.unexpected ]
                                        Lavender -> div [] [ text staticPlantMessages.lavender.unexpected ]
                                        Papaver -> div [] [ text staticPlantMessages.papaver.unexpected ]
                                        GeraniumM -> div [] [ text staticPlantMessages.geraniumM.unexpected ]
                                        GeraniumH -> div [] [ text staticPlantMessages.geraniumH.unexpected ]
                                        TestPlant -> div [] [ text staticPlantMessages.testPlant.unexpected ]

                            Expected ->
                              case plantType of
                                  Strawberry -> div [] [ text staticPlantMessages.strawberry.expected ]
                                  Peaches -> div [] [ text staticPlantMessages.peaches.expected ]
                                  Grapes-> div [] [ text staticPlantMessages.grapes.expected ]
                                  Echinacea -> div [] [ text staticPlantMessages.echinacea.expected ]
                                  Sage -> div [] [ text staticPlantMessages.sage.expected ]
                                  Lavender -> div [] [ text staticPlantMessages.lavender.expected ]
                                  Papaver -> div [] [ text staticPlantMessages.papaver.expected ]
                                  GeraniumM -> div [] [ text staticPlantMessages.geraniumM.expected ]
                                  GeraniumH -> div [] [ text staticPlantMessages.geraniumH.expected ]
                                  TestPlant -> div [] [ text staticPlantMessages.testPlant.expected ]

                            Overgrown ->
                                 case plantType of
                                    Strawberry -> div [] [ text staticPlantMessages.strawberry.overgrown ]
                                    Peaches -> div [] [ text staticPlantMessages.peaches.overgrown ]
                                    Grapes-> div [] [ text staticPlantMessages.grapes.overgrown ]
                                    Echinacea -> div [] [ text staticPlantMessages.echinacea.overgrown ]
                                    Sage -> div [] [ text staticPlantMessages.sage.overgrown ]
                                    Lavender -> div [] [ text staticPlantMessages.lavender.overgrown ]
                                    Papaver -> div [] [ text staticPlantMessages.papaver.overgrown ]
                                    GeraniumM -> div [] [ text staticPlantMessages.geraniumM.overgrown ]
                                    GeraniumH -> div [] [ text staticPlantMessages.geraniumH.overgrown ]
                                    TestPlant -> div [] [ text staticPlantMessages.testPlant.overgrown ]

                            NotGrowing ->
                                  case plantType of
                                    Strawberry -> div [] [ text staticPlantMessages.strawberry.notGrowing ]
                                    Peaches -> div [] [ text staticPlantMessages.peaches.notGrowing ]
                                    Grapes-> div [] [ text staticPlantMessages.grapes.notGrowing ]
                                    Echinacea -> div [] [ text staticPlantMessages.echinacea.notGrowing ]
                                    Sage -> div [] [ text staticPlantMessages.sage.notGrowing ]
                                    Lavender -> div [] [ text staticPlantMessages.lavender.notGrowing ]
                                    Papaver -> div [] [ text staticPlantMessages.papaver.notGrowing ]
                                    GeraniumM -> div [] [ text staticPlantMessages.geraniumM.notGrowing ]
                                    GeraniumH -> div [] [ text staticPlantMessages.geraniumH.notGrowing ]
                                    TestPlant -> div [] [ text staticPlantMessages.testPlant.notGrowing ]




                        months = [plant.progress.jan, plant.progress.feb, plant.progress.mar, plant.progress.apr, plant.progress.may, plant.progress.jun, plant.progress.jul, plant.progress.aug, plant.progress.sep, plant.progress.oct, plant.progress.nov, plant.progress.dec ]
                           in
                            List.map (\m -> viewMonth m) months]
                    , div [] []
                    , ul [ class "navBar" ]
                        [ button [ class "thePlantAllPlantsButton", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                        , button [ class "thePlanPlantsButton", onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                        , button [ class "thePlanButton", onClick (ChangeRoute About) ] [ text "About" ]
                        ]
                    ]
                ]

        About ->
            body [ class "AboutScreenBody" ]
                [ div []
                    [ text "About Screen"
                    , br [] []
                    , ul [ class "navBar" ]
                        [ button [ class "aboutAllPlantsButton", onClick (ChangeRoute AllPlants) ] [ text "All Plants" ]
                        , button [ class "aboutUserPlantsButton", onClick (ChangeRoute UserPlants) ] [ text "User Plants" ]
                        , button [ class "aboutAboutButton", onClick (ChangeRoute About) ] [ text "About" ]
                        ]
                    ]
                ]
