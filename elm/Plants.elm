module Plants exposing (..)


type alias Plant =
    { name : String
    , id_ : Int
    , userFav : Bool
    , description : String
    , progress : ProgressYear
    }


type alias ProgressYear =
    { jan : Progress
    , feb : Progress
    , mar : Progress
    , apr : Progress
    , may : Progress
    , jun : Progress
    , jul : Progress
    , aug : Progress
    , sep : Progress
    , oct : Progress
    , nov : Progress
    , dec : Progress
    }



--  Progress is a union type


type Progress
    = Unexpected
    | Expected
    | Overgrown
    | Default
    | NotGrowing


plant1 : Plant
plant1 =
    { name = "Strawberry"
    , id_ = 1
    , userFav = False
    , description = "Red and tasty"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant2 : Plant
plant2 =
    { name = "Peaches"
    , id_ = 2
    , userFav = False
    , description = "Pinkish and tasty"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant3 : Plant
plant3 =
    { name = "Grapes"
    , id_ = 3
    , userFav = False
    , description = "Too many of them"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant4 : Plant
plant4 =
    { name = "Echinacea"
    , id_ = 4
    , userFav = False
    , description = "Flowery weed"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant5 : Plant
plant5 =
    { name = "Sage"
    , id_ = 5
    , userFav = False
    , description = "Just weed"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant6 : Plant
plant6 =
    { name = "Lavender"
    , id_ = 6
    , userFav = False
    , description = "At least smells nice"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant7 : Plant
plant7 =
    { name = "Papaver orientale 'Forncett Summer'"
    , id_ = 7
    , userFav = False
    , description = "Looks nice"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant8 : Plant
plant8 =
    { name = "Geranium maculatum 'Beth Chatto'"
    , id_ = 8
    , userFav = False
    , description = "Geriatric what?!?"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plant9 : Plant
plant9 =
    { name = "Geranium himalayense 'Gravetye'"
    , id_ = 9
    , userFav = False
    , description = "That's it. We are opening care home !!!"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }


plantDefault : Plant
plantDefault =
    { name = "Default Plant Name"
    , id_ = 999
    , userFav = False
    , description = "Test Plant"
    , progress =
        { jan = Default
        , feb = Default
        , mar = Default
        , apr = Default
        , may = Default
        , jun = Default
        , jul = Default
        , aug = Default
        , sep = Default
        , oct = Default
        , nov = Default
        , dec = Default
        }
    }
