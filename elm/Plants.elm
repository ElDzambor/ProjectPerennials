module Plants exposing (..)


type alias Plant =
    { name : String
    , id_ : Int
    , userFav : Bool
    , description : String
    , type_ : PlantType
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


type PlantType
    = Strawberry
    | Peaches
    | Grapes
    | Echinacea
    | Sage
    | Lavender
    | Papaver
    | GeraniumM
    | GeraniumH
    | TestPlant


plant1 : Plant
plant1 =
    { name = "Strawberry"
    , id_ = 1
    , userFav = False
    , description = "Red and tasty"
    , type_ = Strawberry
    , progress =
        { jan = Default
        , feb = Expected
        , mar = Overgrown
        , apr = Unexpected
        , may = NotGrowing
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
    , type_ = Peaches
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
    , type_ = Grapes
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
    , type_ = Echinacea
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
    , type_ = Sage
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
    , type_ = Lavender
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
    , type_ = Papaver
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
    , type_ = GeraniumM
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
    , type_ = GeraniumH
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
    , type_ = TestPlant
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


staticPlantMessages =
    { strawberry =
        { unexpected = "upps something is really wrong "
        , expected = "All good carry on"
        , overgrown = "Grows better - has some superpower?"
        , default = "Nothing special"
        , notGrowing = "Its not there"
        }
    , peaches =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , grapes =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , echinacea =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , sage =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , lavender =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , papaver =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , geraniumM =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , geraniumH =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    , testPlant =
        { unexpected = "Message"
        , expected = "Other message"
        , overgrown = "Message"
        , default = "Message"
        , notGrowing = "Message"
        }
    }
