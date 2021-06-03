module Positions exposing (..)

import Date exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (..)
import Player exposing (..)
import Time


type Position
    = SmallForward
    | MediumForward
    | KeyForward
    | Ruckman
    | RoverOnballer
    | Winger
    | SmallDefender
    | MediumDefender
    | KeyDefender


positionFromString : String -> Position
positionFromString s =
    case s of
        "Medium Forward" ->
            MediumForward

        "Key Forward" ->
            KeyForward

        "Ruckman" ->
            Ruckman

        "Rover/Onballer" ->
            RoverOnballer

        "Winger" ->
            Winger

        "Small Defender" ->
            SmallDefender

        "Medium Defender" ->
            MediumDefender

        "Key Defender" ->
            KeyDefender

        _ ->
            SmallForward


positionToString : Position -> String
positionToString p =
    case p of
        SmallForward ->
            "Small Forward"

        MediumForward ->
            "Medium Forward"

        KeyForward ->
            "Key Forward"

        Ruckman ->
            "Ruckman"

        RoverOnballer ->
            "Rover/Onballer"

        Winger ->
            "Winger"

        SmallDefender ->
            "Small Defender"

        MediumDefender ->
            "Medium Defender"

        KeyDefender ->
            "Key Defender"


positionToHeightMinMax : Position -> List (Attribute msg)
positionToHeightMinMax p =
    case p of
        SmallForward ->
            [ Html.Attributes.min "165"
            , Html.Attributes.max "175"
            ]

        MediumForward ->
            [ Html.Attributes.min "175"
            , Html.Attributes.max "190"
            ]

        KeyForward ->
            [ Html.Attributes.min "180"
            , Html.Attributes.max "205"
            ]

        Ruckman ->
            [ Html.Attributes.min "185"
            , Html.Attributes.max "215"
            ]

        RoverOnballer ->
            [ Html.Attributes.min "165"
            , Html.Attributes.max "200"
            ]

        Winger ->
            [ Html.Attributes.min "170"
            , Html.Attributes.max "200"
            ]

        SmallDefender ->
            [ Html.Attributes.min "165"
            , Html.Attributes.max "175"
            ]

        MediumDefender ->
            [ Html.Attributes.min "175"
            , Html.Attributes.max "190"
            ]

        KeyDefender ->
            [ Html.Attributes.min "180"
            , Html.Attributes.max "205"
            ]


positionToWeightMinMax : Position -> List (Attribute msg)
positionToWeightMinMax p =
    case p of
        SmallForward ->
            [ Html.Attributes.min "70"
            , Html.Attributes.max "85"
            ]

        MediumForward ->
            [ Html.Attributes.min "80"
            , Html.Attributes.max "95"
            ]

        KeyForward ->
            [ Html.Attributes.min "75"
            , Html.Attributes.max "125"
            ]

        Ruckman ->
            [ Html.Attributes.min "75"
            , Html.Attributes.max "125"
            ]

        RoverOnballer ->
            [ Html.Attributes.min "70"
            , Html.Attributes.max "90"
            ]

        Winger ->
            [ Html.Attributes.min "70"
            , Html.Attributes.max "90"
            ]

        SmallDefender ->
            [ Html.Attributes.min "70"
            , Html.Attributes.max "85"
            ]

        MediumDefender ->
            [ Html.Attributes.min "80"
            , Html.Attributes.max "95"
            ]

        KeyDefender ->
            [ Html.Attributes.min "75"
            , Html.Attributes.max "125"
            ]


positionToDefPlayerStats : Player -> Position -> Player
positionToDefPlayerStats player pos =
    case pos of
        SmallForward ->
            { player
                | speed = 13
                , marking = 10
                , kicking = 13
                , handballing = 10
                , tapwork = 1
                , leading = 7
                , spoiling = 1
                , x_factor = 10
                , goal_sense = 10
                , position = positionToString SmallForward
                , height = 170
                , weight = 70
            }

        MediumForward ->
            { player
                | speed = 6
                , marking = 15
                , kicking = 15
                , handballing = 10
                , tapwork = 1
                , leading = 10
                , spoiling = 3
                , x_factor = 5
                , goal_sense = 10
                , position = positionToString MediumForward
                , height = 182
                , weight = 78
            }

        KeyForward ->
            { player
                | speed = 5
                , marking = 18
                , kicking = 15
                , handballing = 5
                , tapwork = 3
                , leading = 12
                , spoiling = 7
                , x_factor = 3
                , goal_sense = 7
                , position = positionToString KeyForward
                , height = 192
                , weight = 85
            }

        Ruckman ->
            { player
                | speed = 3
                , marking = 12
                , kicking = 5
                , handballing = 5
                , tapwork = 25
                , leading = 5
                , spoiling = 10
                , x_factor = 5
                , goal_sense = 5
                , position = positionToString Ruckman
                , height = 200
                , weight = 93
            }

        RoverOnballer ->
            { player
                | speed = 8
                , marking = 8
                , kicking = 15
                , handballing = 25
                , tapwork = 3
                , leading = 3
                , spoiling = 3
                , x_factor = 5
                , goal_sense = 5
                , position = positionToString RoverOnballer
                , height = 182
                , weight = 80
            }

        Winger ->
            { player
                | speed = 20
                , marking = 10
                , kicking = 15
                , handballing = 15
                , tapwork = 1
                , leading = 5
                , spoiling = 3
                , x_factor = 3
                , goal_sense = 3
                , position = positionToString Winger
                , height = 178
                , weight = 75
            }

        SmallDefender ->
            { player
                | speed = 10
                , marking = 8
                , kicking = 15
                , handballing = 10
                , tapwork = 1
                , leading = 5
                , spoiling = 20
                , x_factor = 3
                , goal_sense = 3
                , position = positionToString SmallDefender
                , height = 170
                , weight = 70
            }

        MediumDefender ->
            { player
                | speed = 8
                , marking = 12
                , kicking = 15
                , handballing = 10
                , tapwork = 1
                , leading = 5
                , spoiling = 20
                , x_factor = 2
                , goal_sense = 2
                , position = positionToString MediumDefender
                , height = 182
                , weight = 78
            }

        KeyDefender ->
            { player
                | speed = 4
                , marking = 15
                , kicking = 15
                , handballing = 5
                , tapwork = 5
                , leading = 8
                , spoiling = 20
                , x_factor = 2
                , goal_sense = 1
                , position = positionToString KeyDefender
                , height = 192
                , weight = 85
            }
