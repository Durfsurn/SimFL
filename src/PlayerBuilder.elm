module PlayerBuilder exposing (..)

import Date exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LocalTeams exposing (..)
import Model exposing (Msg(..))
import Player exposing (..)
import PlayersLike exposing (playerLike)
import Positions exposing (..)


viewPlayerBuilder : Model.Model -> Html Msg
viewPlayerBuilder model =
    let
        sum =
            List.sum [model.player.speed
                , model.player.marking
                , model.player.kicking
                , model.player.handballing
                , model.player.tapwork
                , model.player.leading
                , model.player.spoiling
                , model.player.x_factor
                , model.player.goal_sense]

        ability =
            { nbl =
                if model.player.perk == "nbl" then
                    "is-primary"

                else
                    ""
            , ff =
                if model.player.perk == "ff" then
                    "is-primary"

                else
                    ""
            , utl =
                if model.player.perk == "utl" then
                    "is-primary"

                else
                    ""
            , lgv =
                if model.player.perk == "lgv" then
                    "is-primary"

                else
                    ""
            , sog =
                if model.player.perk == "sog" then
                    "is-primary"

                else
                    ""
            , cm =
                if model.player.perk == "cm" then
                    "is-primary"

                else
                    ""
            }
    in
    div [ class "section" ]
        [ h3 [ class "title is-2" ] [ text "Player Details" ]
        , div [ class "columns" ]
            [ div [ class "column is-4" ]
                [ table [ class "stats table is-fullwidth" ]
                    [ tbody []
                        [ tr []
                            [ td [] [ label [ class "label" ] [ text "DOB:" ] ]
                            , td [ colspan 2 ]
                                [ input
                                    [ class "input is-fullwidth"
                                    , type_ "date"
                                    , Html.Attributes.min <| Date.toIsoString <| Date.add Date.Years -30 <| Date.fromPosix model.zone model.today
                                    , Html.Attributes.max <| Date.toIsoString <| Date.add Date.Years -17 <| Date.fromPosix model.zone model.today
                                    , value <| Date.toIsoString model.player.dob
                                    , onInput (ChangePlayerStat DOB)
                                    ]
                                    []
                                ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Position:" ] ]
                            , td [ colspan 2 ]
                                [ div [ class "select is-fullwidth" ]
                                    [ select
                                        [ value model.player.position
                                        , onInput (ChangePlayerStat Position)
                                        ]
                                        [ option [ value <| positionToString SmallForward ] [ text <| positionToString SmallForward ]
                                        , option [ value <| positionToString MediumForward ] [ text <| positionToString MediumForward ]
                                        , option [ value <| positionToString KeyForward ] [ text <| positionToString KeyForward ]
                                        , option [ value <| positionToString Ruckman ] [ text <| positionToString Ruckman ]
                                        , option [ value <| positionToString RoverOnballer ] [ text <| positionToString RoverOnballer ]
                                        , option [ value <| positionToString Winger ] [ text <| positionToString Winger ]
                                        , option [ value <| positionToString SmallDefender ] [ text <| positionToString SmallDefender ]
                                        , option [ value <| positionToString MediumDefender ] [ text <| positionToString MediumDefender ]
                                        , option [ value <| positionToString KeyDefender ] [ text <| positionToString KeyDefender ]
                                        ]
                                    ]
                                ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Origin:" ] ]
                            , td [ colspan 2 ]
                                [ div [ class "select is-fullwidth" ]
                                    [ select
                                        [ value model.player.origin
                                        , onInput (ChangePlayerStat Origin)
                                        ]
                                        [ option [ value "VIC" ] [ text "VIC" ]
                                        , option [ value "NSW" ] [ text "NSW" ]
                                        , option [ value "QLD" ] [ text "QLD" ]
                                        , option [ value "SA" ] [ text "SA" ]
                                        , option [ value "WA" ] [ text "WA" ]
                                        , option [ value "TAS" ] [ text "TAS" ]
                                        , option [ value "ACT" ] [ text "ACT" ]
                                        , option [ value "NT" ] [ text "NT" ]
                                        , option [ value "Ireland" ] [ text "Ireland" ]
                                        , option [ value "Austria" ] [ text "Austria" ]
                                        , option [ value "Brazil" ] [ text "Brazil" ]
                                        , option [ value "Canada" ] [ text "Canada" ]
                                        , option [ value "Catalonia" ] [ text "Catalonia" ]
                                        , option [ value "Chile" ] [ text "Chile" ]
                                        , option [ value "Croatia" ] [ text "Croatia" ]
                                        , option [ value "Denmark" ] [ text "Denmark" ]
                                        , option [ value "Fiji" ] [ text "Fiji" ]
                                        , option [ value "France" ] [ text "France" ]
                                        , option [ value "Germany" ] [ text "Germany" ]
                                        , option [ value "Japan" ] [ text "Japan" ]
                                        , option [ value "Kenya" ] [ text "Kenya" ]
                                        , option [ value "Lebanon" ] [ text "Lebanon" ]
                                        , option [ value "Nauru" ] [ text "Nauru" ]
                                        , option [ value "Netherlands" ] [ text "Netherlands" ]
                                        , option [ value "New Zealand" ] [ text "New Zealand" ]
                                        , option [ value "Papua New Guinea" ] [ text "Papua New Guinea" ]
                                        , option [ value "Poland" ] [ text "Poland" ]
                                        , option [ value "Samoa" ] [ text "Samoa" ]
                                        , option [ value "Scotland" ] [ text "Scotland" ]
                                        , option [ value "South Africa" ] [ text "South Africa" ]
                                        , option [ value "Spain" ] [ text "Spain" ]
                                        , option [ value "Sweden" ] [ text "Sweden" ]
                                        , option [ value "South Korea" ] [ text "South Korea" ]
                                        , option [ value "Tonga" ] [ text "Tonga" ]
                                        , option [ value "United Kingdom" ] [ text "United Kingdom" ]
                                        , option [ value "United States" ] [ text "United States" ]
                                        , option [ value "Wales" ] [ text "Wales" ]
                                        ]
                                    ]
                                ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Local Team:" ] ]
                            , td [ colspan 2 ]
                                [ div [ class "select is-fullwidth" ]
                                    [ select
                                        [ value model.player.local_team
                                        , onInput (ChangePlayerStat LocalTeam)
                                        ]
                                        (originToLocalTeamsHtml model.player.origin)
                                    ]
                                ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "AFL Team:" ] ]
                            , td [ colspan 2 ]
                                [ div [ class "select is-fullwidth" ]
                                    [ select
                                        [ value model.player.afl_team
                                        , onInput (ChangePlayerStat AFLTeam)
                                        ]
                                        [ option [ value "Adelaide" ] [ text "Adelaide" ]
                                        , option [ value "Brisbane Lions" ] [ text "Brisbane Lions" ]
                                        , option [ value "Carlton" ] [ text "Carlton" ]
                                        , option [ value "Collingwood" ] [ text "Collingwood" ]
                                        , option [ value "Essendon" ] [ text "Essendon" ]
                                        , option [ value "Fremantle" ] [ text "Fremantle" ]
                                        , option [ value "Geelong " ] [ text "Geelong" ]
                                        , option [ value "Gold Coast" ] [ text "Gold Coast" ]
                                        , option [ value "Greater Western Sydney" ] [ text "Greater Western Sydney" ]
                                        , option [ value "Hawthorn" ] [ text "Hawthorn" ]
                                        , option [ value "Melbourne" ] [ text "Melbourne" ]
                                        , option [ value "North Melbourne" ] [ text "North Melbourne" ]
                                        , option [ value "Port Adelaide" ] [ text "Port Adelaide" ]
                                        , option [ value "Richmond" ] [ text "Richmond" ]
                                        , option [ value "St Kilda" ] [ text "St Kilda" ]
                                        , option [ value "Sydney" ] [ text "Sydney" ]
                                        , option [ value "West Coast" ] [ text "West Coast" ]
                                        , option [ value "Western Bulldogs" ] [ text "Western Bulldogs" ]
                                        ]
                                    ]
                                ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Height:" ] ]
                            , td []
                                [ input
                                    ([ value <| String.fromInt model.player.height
                                     , class "slider is-fullwidth"
                                     , type_ "range"
                                     , onInput (ChangePlayerStat Height)
                                     ]
                                        ++ (positionToHeightMinMax <| positionFromString model.player.position)
                                    )
                                    []
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.height ++ "cm" ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Weight:" ] ]
                            , td []
                                [ input
                                    ([ value <| String.fromInt model.player.weight
                                     , class "slider is-fullwidth"
                                     , type_ "range"
                                     , onInput (ChangePlayerStat Weight)
                                     ]
                                        ++ (positionToWeightMinMax <| positionFromString model.player.position)
                                    )
                                    []
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.weight ++ "kg" ]
                            ]
                        , tr []
                            [ td [ style "width" "65px" ] [ label [] [ text "Quiet" ] ]
                            , td []
                                [ input
                                    [ value <| String.fromInt model.player.personality
                                    , class "slider is-fullwidth"
                                    , type_ "range"
                                    , onInput (ChangePlayerStat Personality)
                                    , Html.Attributes.min "1"
                                    , Html.Attributes.max "100"
                                    ]
                                    []
                                ]
                            , td [ style "width" "65px" ] [ label [ class "label" ] [ text "Loud" ] ]
                            ]
                        , tr []
                            [ td [ style "width" "65px" ] [ label [] [ text "Passive" ] ]
                            , td []
                                [ input
                                    [ value <| String.fromInt model.player.mood
                                    , class "slider is-fullwidth"
                                    , type_ "range"
                                    , onInput (ChangePlayerStat Mood)
                                    , Html.Attributes.min "1"
                                    , Html.Attributes.max "100"
                                    ]
                                    []
                                ]
                            , td [ style "width" "65px" ] [ label [ class "label" ] [ text "Aggressive" ] ]
                            ]
                        , tr []
                            [ td [ style "width" "65px" ] [ label [] [ text "Injury Prone" ] ]
                            , td []
                                [ input
                                    [ value <| String.fromInt model.player.injury
                                    , class "slider is-fullwidth"
                                    , type_ "range"
                                    , onInput (ChangePlayerStat Injury)
                                    , Html.Attributes.min "1"
                                    , Html.Attributes.max "100"
                                    ]
                                    []
                                ]
                            , td [ style "width" "65px" ] [ label [ class "label" ] [ text "Hardy" ] ]
                            ]
                        ]
                    ]
                , div [ style "display" "inline-flex" ]
                    [ label
                        [ class "label"
                        , style "padding-top" "8px"
                        , style "padding-right" "10px"
                        ]
                        [ text "Save Player and Continue: " ]
                    , button
                        [ class "button is-primary "
                        , onClick SaveStats
                        , disabled (sum < 75 || sum > 75)
                        ]
                        [ text "Save" ]
                    ]
                ]
            , div [ class "column is-4" ]
                [ table [ class "stats table is-fullwidth" ]
                    [ tbody []
                        [ tr []
                            [ td [] [ label [ class "label" ] [ text "Speed:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.speed Speed
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.speed ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Marking:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.marking Marking
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.marking ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Kicking:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.kicking Kicking
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.kicking ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Handballing:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.handballing Handballing
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.handballing ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Tapwork:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.tapwork Tapwork
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.tapwork ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Leading:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.leading Leading
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.leading ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Spoiling:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.spoiling Spoiling
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.spoiling ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "X-Factor:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.x_factor XFactor
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.x_factor ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Goal Sense:" ] ]
                            , td []
                                [ createPlayerStatInput model.player.goal_sense GoalSense
                                ]
                            , td [ style "width" "65px" ] [ text <| String.fromInt model.player.goal_sense ]
                            ]
                        , tr []
                            [ td [] [ label [ class "label" ] [ text "Total Points:" ] ]
                            , td [ colspan 2 ]
                                [ div [ style "display" "inline-flex" ]
                                    [ input
                                        [ class "input is-small"
                                        , disabled True
                                        , style "color" "black"
                                        , style "font-weight" "bold"
                                        , value
                                            (String.fromInt
                                                sum
                                                ++ " / 75"
                                            )
                                        , type_ "text"
                                        ]
                                        []
                                    , button [ class "button is-small is-danger", onClick Reset ] [ text "Reset" ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div [ class "column is-fullwidth" ]
                [ div []
                    [ h3 [ class "title is-3" ] [ text "Similar Players: " ]
                    , div [] <| List.map (\pl -> tr [] [ a [ href <| "https://www.google.com.au/search?q=" ++ String.replace " " "+" pl ++ "+afl" ] [ text pl ] ]) <| playerLike model.player
                    , br [] []
                    , h3 [ class "title is-3" ] [ text "Natural Ability: " ]
                    , div [ class "tile is-parent" ]
                        [ div [ class "tile is-child perk-border box", class ability.nbl, onClick (ChangePlayerPerk "nbl") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Natural Born Leader" ]
                            , p [ class "emoji-icon" ] [ text "💡" ]
                            , h6 [ class "sub" ] [ text "More likely to receieve leadership roles, stands up in poor team performances." ]
                            ]
                        , div [ class "tile is-child perk-border box", class ability.ff, onClick (ChangePlayerPerk "ff") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Finals Fever" ]
                            , p [ class "emoji-icon" ] [ text "⚡" ]
                            , h6 [ class "sub" ] [ text "Shines in the spotlight - noticeably better performance during big games." ]
                            ]
                        ]
                    , div [ class "tile is-parent" ]
                        [ div [ class "tile is-child perk-border box", class ability.utl, onClick (ChangePlayerPerk "utl") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Utilitarian" ]
                            , p [ class "emoji-icon" ] [ text "👨\u{200D}🔧" ]
                            , h6 [ class "sub" ] [ text "Has the ability to excel at a new position if offered by the coach." ]
                            ]
                        , div [ class "tile is-child perk-border box", class ability.lgv, onClick (ChangePlayerPerk "lgv") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Longevity" ]
                            , p [ class "emoji-icon" ] [ text "👴" ]
                            , h6 [ class "sub" ] [ text "Plans on sticking around, recovers quickler from injuries which occur rarely." ]
                            ]
                        ]
                    , div [ class "tile is-parent" ]
                        [ div [ class "tile is-child perk-border box", class ability.sog, onClick (ChangePlayerPerk "sog") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Son of a Gun" ]
                            , p [ class "emoji-icon" ] [ text "👨\u{200D}👩\u{200D}👦" ]
                            , h6 [ class "sub" ] [ text "Famous father - increases chance of going to selected AFL Team via F/S rule." ]
                            ]
                        , div [ class "tile is-child perk-border box", class ability.cm, onClick (ChangePlayerPerk "cm") ]
                            [ h4 [ class "title is-5 margin-bottom-five" ] [ text "Coaching Mind" ]
                            , p [ class "emoji-icon" ] [ text "\u{1F9E0}" ]
                            , h6 [ class "sub" ] [ text "Coaches pet - increases likelihood of a late career contract extension as player-coach." ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


createPlayerStatInput : Int -> PlayerStat -> Html Msg
createPlayerStatInput int stat =
    input
        [ value <| String.fromInt int
        , class "slider is-fullwidth"
        , type_ "range"
        , Html.Attributes.min "1"
        , Html.Attributes.max "100"
        , onInput (ChangePlayerStat stat)
        ]
        []
