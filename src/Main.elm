module Main exposing (..)

import Browser
import Date exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LocalTeams exposing (..)
import Model exposing (Msg(..), View(..))
import Player exposing (..)
import PlayerBuilder exposing (viewPlayerBuilder)
import Positions exposing (..)
import Process
import Random
import StateDraft exposing (randomiseLocalTeams, viewPlayerDraft)
import Task
import Time


randomInt : (Int -> Msg) -> Int -> Int -> Cmd Msg
randomInt msg i1 i2 =
    Random.int i1 i2 |> Random.generate msg


delay : Float -> msg -> Cmd msg
delay time msg =
    Process.sleep time
        |> Task.perform (\_ -> msg)


subscriptions : Model.Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program () Model.Model Msg
main =
    Browser.element
        { init = Model.init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


getZone : Cmd Msg
getZone =
    Task.perform GotZone Time.here


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Rand10Int int ->
            ( { model | rand_1_10 = int }, Cmd.none )

        Rand100Int int ->
            ( { model | rand_1_100 = int }, Cmd.none )

        Rand1000Int int ->
            ( { model | rand_1_100 = int }, Cmd.none )

        ShuffleLocalTeams ->
            ( model, randomiseLocalTeams model )

        ShuffledLocalTeams shuffle ->
            let
                s =
                    model.status

                t =
                    List.take 3 shuffle |> List.take 2 |> List.reverse |> List.head |> Maybe.withDefault ""

                count =
                    model.shuffle_count + 1

                ( team, cmd ) =
                    if count >= 20 then
                        if
                            t
                                /= model.player.local_team
                                && (model.rand_1_10 >= 4)
                        then
                            ( model.status.state_team, delay 1000 ShuffleLocalTeams )

                        else if t == model.player.local_team then
                            ( t, Cmd.none )

                        else
                            ( t, Cmd.none )

                    else if count >= 10 then
                        ( model.status.state_team, delay (toFloat <| 100 * (count - 10)) ShuffleLocalTeams )

                    else
                        ( model.status.state_team, delay 100 ShuffleLocalTeams )
            in
            ( { model | shuffle = shuffle, shuffle_count = count, status = { s | state_team = team } }
            , Cmd.batch
                [ cmd
                , randomInt Rand10Int 1 10
                , randomInt Rand100Int 1 100
                , randomInt Rand1000Int 1 1000
                ]
            )

        GotTime t ->
            ( { model | today = t }, getZone )

        GotZone z ->
            ( { model | zone = z, current_date = Date.fromPosix z model.today }, Cmd.none )

        Reset ->
            ( { model
                | player =
                    positionToDefPlayerStats model.player (positionFromString model.player.position)
              }
            , Cmd.none
            )

        SaveStats ->
            ( { model
                | view = Draft
                , current_date = Date.fromCalendarDate (Date.year model.current_date) Time.Nov 1
              }
            , randomiseLocalTeams model
            )

        StartStateSeason ->
            ( { model
                | view = StateSeason
                , current_date = Date.fromCalendarDate (Date.year model.current_date) Time.Nov 1
              }
            , randomiseLocalTeams model
            )

        ChangePlayerPerk perk ->
            let
                p =
                    model.player
            in
            ( { model | player = { p | perk = perk } }, Cmd.none )

        ChangePlayerStat stat v ->
            let
                p =
                    model.player

                val =
                    String.toInt v |> Maybe.withDefault 0
            in
            case stat of
                Speed ->
                    ( { model | player = { p | speed = val } }, Cmd.none )

                Marking ->
                    ( { model | player = { p | marking = val } }, Cmd.none )

                Kicking ->
                    ( { model | player = { p | kicking = val } }, Cmd.none )

                Handballing ->
                    ( { model | player = { p | handballing = val } }, Cmd.none )

                Tapwork ->
                    ( { model | player = { p | tapwork = val } }, Cmd.none )

                Leading ->
                    ( { model | player = { p | leading = val } }, Cmd.none )

                Spoiling ->
                    ( { model | player = { p | spoiling = val } }, Cmd.none )

                XFactor ->
                    ( { model | player = { p | x_factor = val } }, Cmd.none )

                GoalSense ->
                    ( { model | player = { p | goal_sense = val } }, Cmd.none )

                DOB ->
                    ( { model | player = { p | dob = Result.withDefault (Date.fromCalendarDate 2003 Time.Jan 1) <| Date.fromIsoString v } }, Cmd.none )

                Position ->
                    ( { model | player = positionToDefPlayerStats model.player (positionFromString v) }, Cmd.none )

                Height ->
                    ( { model | player = { p | height = val } }, Cmd.none )

                Weight ->
                    ( { model | player = { p | weight = val } }, Cmd.none )

                Personality ->
                    ( { model | player = { p | personality = val } }, Cmd.none )

                Mood ->
                    ( { model | player = { p | mood = val } }, Cmd.none )

                Injury ->
                    ( { model | player = { p | injury = val } }, Cmd.none )

                Origin ->
                    ( { model | player = { p | origin = v } }, Cmd.none )

                LocalTeam ->
                    ( { model | player = { p | local_team = v } }, Cmd.none )

                AFLTeam ->
                    ( { model | player = { p | afl_team = v } }, Cmd.none )


view : Model.Model -> Html Msg
view model =
    div []
        [ case model.view of
            PlayerBuilder ->
                viewPlayerBuilder model

            Draft ->
                viewPlayerDraft model

            StateSeason ->
                viewStateSeason model
        ]
