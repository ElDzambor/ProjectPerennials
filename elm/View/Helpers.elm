module View.Helpers exposing (..)

import Html exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Plants exposing (..)


viewMonths : Plant -> List (Html Msg)
viewMonths plant =
    let
        months =
            [ plant.progress.jan
            , plant.progress.feb
            , plant.progress.mar
            , plant.progress.apr
            , plant.progress.may
            , plant.progress.jun
            , plant.progress.jul
            , plant.progress.aug
            , plant.progress.sep
            , plant.progress.oct
            , plant.progress.nov
            , plant.progress.dec
            ]
    in
    List.map (\m -> viewMonth m plant.type_) months


viewMonth : Progress -> PlantType -> Html Msg
viewMonth month plantType =
    case month of
        Unexpected ->
            case plantType of
                Strawberry ->
                    div [] [ text staticPlantMessages.strawberry.unexpected ]

                Peaches ->
                    div [] [ text staticPlantMessages.peaches.unexpected ]

                Grapes ->
                    div [] [ text staticPlantMessages.grapes.unexpected ]

                Echinacea ->
                    div [] [ text staticPlantMessages.echinacea.unexpected ]

                Sage ->
                    div [] [ text staticPlantMessages.sage.unexpected ]

                Lavender ->
                    div [] [ text staticPlantMessages.lavender.unexpected ]

                Papaver ->
                    div [] [ text staticPlantMessages.papaver.unexpected ]

                GeraniumM ->
                    div [] [ text staticPlantMessages.geraniumM.unexpected ]

                GeraniumH ->
                    div [] [ text staticPlantMessages.geraniumH.unexpected ]

                TestPlant ->
                    div [] [ text staticPlantMessages.testPlant.unexpected ]

        Expected ->
            case plantType of
                Strawberry ->
                    div [] [ text staticPlantMessages.strawberry.expected ]

                Peaches ->
                    div [] [ text staticPlantMessages.peaches.expected ]

                Grapes ->
                    div [] [ text staticPlantMessages.grapes.expected ]

                Echinacea ->
                    div [] [ text staticPlantMessages.echinacea.expected ]

                Sage ->
                    div [] [ text staticPlantMessages.sage.expected ]

                Lavender ->
                    div [] [ text staticPlantMessages.lavender.expected ]

                Papaver ->
                    div [] [ text staticPlantMessages.papaver.expected ]

                GeraniumM ->
                    div [] [ text staticPlantMessages.geraniumM.expected ]

                GeraniumH ->
                    div [] [ text staticPlantMessages.geraniumH.expected ]

                TestPlant ->
                    div [] [ text staticPlantMessages.testPlant.expected ]

        Overgrown ->
            case plantType of
                Strawberry ->
                    div [] [ text staticPlantMessages.strawberry.overgrown ]

                Peaches ->
                    div [] [ text staticPlantMessages.peaches.overgrown ]

                Grapes ->
                    div [] [ text staticPlantMessages.grapes.overgrown ]

                Echinacea ->
                    div [] [ text staticPlantMessages.echinacea.overgrown ]

                Sage ->
                    div [] [ text staticPlantMessages.sage.overgrown ]

                Lavender ->
                    div [] [ text staticPlantMessages.lavender.overgrown ]

                Papaver ->
                    div [] [ text staticPlantMessages.papaver.overgrown ]

                GeraniumM ->
                    div [] [ text staticPlantMessages.geraniumM.overgrown ]

                GeraniumH ->
                    div [] [ text staticPlantMessages.geraniumH.overgrown ]

                TestPlant ->
                    div [] [ text staticPlantMessages.testPlant.overgrown ]

        Default ->
            case plantType of
                Strawberry ->
                    div [] [ text staticPlantMessages.strawberry.notGrowing ]

                Peaches ->
                    div [] [ text staticPlantMessages.peaches.notGrowing ]

                Grapes ->
                    div [] [ text staticPlantMessages.grapes.notGrowing ]

                Echinacea ->
                    div [] [ text staticPlantMessages.echinacea.notGrowing ]

                Sage ->
                    div [] [ text staticPlantMessages.sage.notGrowing ]

                Lavender ->
                    div [] [ text staticPlantMessages.lavender.notGrowing ]

                Papaver ->
                    div [] [ text staticPlantMessages.papaver.notGrowing ]

                GeraniumM ->
                    div [] [ text staticPlantMessages.geraniumM.notGrowing ]

                GeraniumH ->
                    div [] [ text staticPlantMessages.geraniumH.notGrowing ]

                TestPlant ->
                    div [] [ text staticPlantMessages.testPlant.notGrowing ]

        NotGrowing ->
            case plantType of
                Strawberry ->
                    div [] [ text staticPlantMessages.strawberry.notGrowing ]

                Peaches ->
                    div [] [ text staticPlantMessages.peaches.notGrowing ]

                Grapes ->
                    div [] [ text staticPlantMessages.grapes.notGrowing ]

                Echinacea ->
                    div [] [ text staticPlantMessages.echinacea.notGrowing ]

                Sage ->
                    div [] [ text staticPlantMessages.sage.notGrowing ]

                Lavender ->
                    div [] [ text staticPlantMessages.lavender.notGrowing ]

                Papaver ->
                    div [] [ text staticPlantMessages.papaver.notGrowing ]

                GeraniumM ->
                    div [] [ text staticPlantMessages.geraniumM.notGrowing ]

                GeraniumH ->
                    div [] [ text staticPlantMessages.geraniumH.notGrowing ]

                TestPlant ->
                    div [] [ text staticPlantMessages.testPlant.notGrowing ]
