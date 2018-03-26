module Css exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


myContainer : Attribute msg
myContainer =
    style
        [ ( "backgroundColor", "#98AFC7" )
        , ( "height", "1000px" )
        , ( "width", "400px" )
        , ( "marginLeft", "auto" )
        , ( "marginRight", "auto" )
        , ( "border", "1px solid #000" )
        , ( "boxSizing", "border-box" )
        , ( "padding", "0px" )
        ]


myNav : Attribute msg
myNav =
    style
        [ ( "list-style-type", " none" )
        , ( "margin", "0" )
        , ( "padding", "0" )
        , ( "overflow", "hidden" )
        , ( "background-color", "#333" )
        , ( "position", "fixed" )
        , ( "bottom", "0" )
        , ( "width", " 398px" )
        ]


myHeader : Attribute msg
myHeader =
    style
        [ ( "backgroundColor", "#C7B097" )
        , ( "height", "30px" )
        , ( "width", "100%" )
        , ( "textAlign", "center" )
        , ( "border", "1px solid #000" )
        , ( "boxSizing", "border-box" )
        ]


myAside : Attribute msg
myAside =
    style
        [ ( "backgroundColor", "#FDEEF4" )
        , ( "height", "500px" )
        , ( "width", "70%" )
        , ( "textAlign", "center" )
        , ( "float", "left" )
        , ( "border", "1px solid #000" )
        , ( "boxSizing", "border-box" )
        ]


myButton : Attribute msg
myButton =
    style
        [ ( "backgroundColor", "White" )
        , ( "height", "20px" )
        , ( "width", "80%" )
        , ( "textAlign", "center" )
        ]
