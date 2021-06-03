module Model exposing (Model, Msg(..), View(..), init)

import Date exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LocalTeams exposing (..)
import Player exposing (..)
import Positions exposing (..)
import Random.Array exposing (shuffle)
import Task
import Time


getTime : Cmd Msg
getTime =
    Task.perform GotTime Time.now


init : () -> ( Model, Cmd Msg )
init _ =
    ( { player = positionToDefPlayerStats defPlayer SmallForward
      , status = defPlayerStatus
      , today = Time.millisToPosix 0
      , zone = Time.utc
      , view = PlayerBuilder
      , transition = ""
      , shuffle = []
      , shuffle_count = 0
      , rand_1_10 = 0
      , rand_1_100 = 0
      , rand_1_1000 = 0
      , current_date = Date.fromCalendarDate 2021 Time.Jan 1
      }
    , Cmd.batch [ Task.perform (always Reset) (Task.succeed ()), getTime ]
    )


type alias Model =
    { player : Player
    , status : PlayerStatus
    , today : Time.Posix
    , zone : Time.Zone
    , view : View
    , transition : String
    , shuffle : List String
    , shuffle_count : Int
    , rand_1_10 : Int
    , rand_1_100 : Int
    , rand_1_1000 : Int
    , current_date : Date
    }


type View
    = PlayerBuilder
    | Draft


type Msg
    = NoOp
    | ChangePlayerStat PlayerStat String
    | ChangePlayerPerk String
    | ShuffleLocalTeams
    | ShuffledLocalTeams (List String)
    | Rand10Int Int
    | Rand100Int Int
    | Rand1000Int Int
    | Reset
    | SaveStats
    | GotTime Time.Posix
    | GotZone Time.Zone
