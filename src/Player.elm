module Player exposing (Level(..), Player, PlayerStat(..), PlayerStatus, defPlayer, defPlayerStatus, levelToString)

import Date exposing (Date)
import Time


type alias Player =
    { speed : Int
    , marking : Int
    , kicking : Int
    , handballing : Int
    , tapwork : Int
    , leading : Int
    , spoiling : Int
    , x_factor : Int
    , goal_sense : Int
    , dob : Date
    , position : String
    , height : Int
    , weight : Int
    , personality : Int
    , mood : Int
    , injury : Int
    , origin : String
    , local_team : String
    , afl_team : String
    , perk : String
    }


defPlayerStatus : PlayerStatus
defPlayerStatus =
    { level = Under19s
    , injury = "Healthy"
    , leadership_group = "Not in leadership group."
    }


type alias PlayerStatus =
    { level : Level
    , injury : String
    , leadership_group : String
    }


type Level
    = Juniors
    | Under19s
    | StateRep
    | AFL


levelToString : Level -> Player -> String
levelToString l { origin, local_team } =
    case l of
        Juniors ->
            local_team ++ " Under 18s"

        Under19s ->
            case origin of
                "SA" ->
                    "SAFL Reserves"

                "WA" ->
                    "WAFL Reserves"

                _ ->
                    "VFL Reserves"

        StateRep ->
            case origin of
                "SA" ->
                    "SAFL"

                "WA" ->
                    "WAFL"

                _ ->
                    "VFL"

        AFL ->
            "AFL"


type PlayerStat
    = Speed
    | Marking
    | Kicking
    | Handballing
    | Tapwork
    | Leading
    | Spoiling
    | XFactor
    | GoalSense
    | DOB
    | Position
    | Height
    | Weight
    | Personality
    | Mood
    | Injury
    | Origin
    | LocalTeam
    | AFLTeam


defPlayer : Player
defPlayer =
    { speed = 0
    , marking = 0
    , kicking = 0
    , handballing = 0
    , tapwork = 0
    , leading = 0
    , spoiling = 0
    , x_factor = 0
    , goal_sense = 0
    , dob = Date.fromCalendarDate 2003 Time.Jan 1
    , position = "Small Forward"
    , height = 175
    , weight = 75
    , personality = 50
    , mood = 50
    , injury = 50
    , origin = "VIC"
    , local_team = "Box Hill"
    , afl_team = "Carlton"
    , perk = "nbl"
    }
