module StateDraft exposing (..)

import Date exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LocalTeams exposing (..)
import Model exposing (Model, Msg(..))
import Player exposing (..)
import Positions exposing (..)
import Random
import Random.List
import Time


monthToMonthStr : Time.Month -> String
monthToMonthStr m =
    case m of
        Time.Jan ->
            "Jan"

        Time.Feb ->
            "Feb"

        Time.Mar ->
            "Mar"

        Time.Apr ->
            "Apr"

        Time.May ->
            "May"

        Time.Jun ->
            "Jun"

        Time.Jul ->
            "Jul"

        Time.Aug ->
            "Aug"

        Time.Sep ->
            "Sep"

        Time.Oct ->
            "Oct"

        Time.Nov ->
            "Nov"

        Time.Dec ->
            "Dec"


formatDate : Date -> String
formatDate d =
    String.join " " [ Date.day d |> String.fromInt, Date.month d |> monthToMonthStr, Date.year d |> String.fromInt ]


randomiseLocalTeams : Model -> Cmd Msg
randomiseLocalTeams model =
    Random.generate ShuffledLocalTeams <|
        Random.List.shuffle <|
            originToLocalTeams model.player.origin


viewPlayerDraft : Model -> Html Msg
viewPlayerDraft model =
    let
        ( cls, cl, ct ) =
            if model.status.state_team /= "" then
                ( class <| "show", levelToString StateRep model.player, model.status.state_team )

            else
                ( class <| "", "Under 18s Comp", levelToString Player.Juniors model.player )
    in
    div [ class "section" ]
        [ h3 [ class "title is-2" ] [ text "Draft Night" ]
        , div [ class "level" ]
            [ div [] []
            , div []
                [ h4 [ class "title is-4" ] [ text "Current Date: " ]
                , p [ class "has-text-centered" ] [ text <| Date.toIsoString model.current_date ]
                ]
            , div []
                [ h4 [ class "title is-4" ] [ text "Current League: " ]
                , p [ class "has-text-centered" ] [ text cl ]
                ]
            , div []
                [ h4 [ class "title is-4" ] [ text "Current Team: " ]
                , p [ class "has-text-centered" ] [ text ct ]
                ]
            , div []
                [ h4 [ class "title is-4" ] [ text "Injury Status: " ]
                , p [ class "has-text-centered" ] [ text model.status.injury ]
                ]
            , div []
                [ h4 [ class "title is-4" ] [ text "Leadership Group Status: " ]
                , p [ class "has-text-centered" ] [ text model.status.leadership_group ]
                ]

            -- , div []
            --     [ h4 [ class "title is-4" ] [ text "Spin: " ]
            --     , p [ class "has-text-centered" ] [ text <| String.fromInt model.shuffle_count ]
            --     ]
            , div [] []
            ]
        , div [ class "has-text-centered" ]
            [ div [ class "center draft-spin" ]
                [ table [ class "table" ]
                    [ tbody [] <|
                        List.indexedMap
                            (\i t ->
                                if i /= 1 then
                                    tr [ class "has-text-centered" ] [ td [] [], td [] [ text t ], td [] [] ]

                                else
                                    tr [ class "has-text-centered" ]
                                        [ td [] [ text "⏩" ]
                                        , td [ style "width" "700px" ] [ text t ]
                                        , td [] [ text "⏪" ]
                                        ]
                            )
                        <|
                            List.take 3 <|
                                model.shuffle
                    ]
                ]
            ]
        , div [ class "confettis", cls ]
            [ div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            , div [ class "confetti", cls ] []
            ]
        ]
