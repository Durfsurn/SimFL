module LocalTeams exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


originToLocalTeamsHtml : String -> List (Html msg)
originToLocalTeamsHtml origin =
    List.map (\c -> option [ value c ] [ text c ]) <| originToLocalTeams origin


originToLocalTeams : String -> List String
originToLocalTeams origin =
    case origin of
        "VIC" ->
            [ "Box Hill"
            , "Carlton (Reserves)"
            , "Casey"
            , "Coburg"
            , "Collingwood (Reserves)"
            , "Essendon (Reserves)"
            , "Footscray (Reserves)"
            , "Frankston"
            , "Geelong (Reserves)"
            , "North Melbourne (Reserves)"
            , "Northern Bullants"
            , "Port Melbourne"
            , "Richmond (Reserves)"
            , "Sandringham"
            , "Werribee"
            , "Williamstown"
            ]

        "NSW" ->
            [ "Greater Western Sydney (Reserves)"
            , "Balmain Tigers"
            , "Campbelltown Blues"
            , "East Coast Eagles"
            , "North Shore Bombers"
            , "Pennant Hills Demons"
            , "Queanbeyan Tigers"
            , "St George Dragons"
            , "Sydney (Reserves)"
            , "Sydney University Students"
            , "UNSW Bulldogs"
            , "Western Suburbs Magpies"
            , "Wollongong Lions"
            ]

        "QLD" ->
            [ "Aspley"
            , "Brisbane (Reserves)"
            , "Gold Coast (Reserves)"
            , "Redland"
            , "Southport"
            , "Broadbeach"
            , "Labrador"
            , "Morningside"
            , "Mount Gravatt"
            , "Palm Beach Currumbin"
            , "Sandgate"
            , "Surfers Paradise"
            , "Western Districts"
            , "Wilston Grange"
            ]

        "SA" ->
            [ "Central District"
            , "Glenelg"
            , "North Adelaide"
            , "Norwood"
            , "Port Adelaide"
            , "South Adelaide"
            , "Sturt"
            , "West Adelaide"
            , "Woodville-West Torrens"
            ]

        "WA" ->
            [ "Claremont Tigers"
            , "East Fremantle Sharks"
            , "East Perth Royals"
            , "Peel Thunder"
            , "Perth Demons"
            , "South Fremantle Bulldogs"
            , "Subiaco Lions"
            , "Swan Districts Swans"
            , "West Perth Falcons"
            ]

        "TAS" ->
            [ "Burnie Dockers"
            , "Clarence Roos"
            , "Glenorchy Magpies"
            , "Lauderdale Bombers"
            , "Launceston Blues"
            , "Hobart City Demons"
            , "North Launceston Bombers"
            , "Tigers FC"
            ]

        "ACT" ->
            [ "Ainslie Kangaroos"
            , "Belconnen Magpies"
            , "Eastlake Demons"
            , "Tuggeranong Hawks"
            ]

        "NT" ->
            [ "Darwin Buffaloes"
            , "Nightcliff Tigers"
            , "Palmerston Magpies"
            , "Southern Districts Crocs"
            , "St Mary's Saints"
            , "Tiwi Islands Bombers"
            , "Wanderers Eagles"
            , "Waratah Warriors"
            ]

        "Ireland" ->
            [ "South Dublin Swans"
            , "Leeside Lions"
            , "Galway Magpies"
            , "Belfast Redbacks"
            ]

        "Austria" ->
            [ "Austria (Avalanche)" ]

        "Brazil" ->
            [ "Brazil" ]

        "Canada" ->
            [ "Canada (Northwind/Northern Lights)" ]

        "Catalonia" ->
            [ "Belfry Valls"
            , "Cornellà Bocs"
            , "Andorra Crows"
            , "Perpignan Tigers"
            ]

        "Chile" ->
            [ "Chile" ]

        "Croatia" ->
            [ "Croatia (Knights)" ]

        "Denmark" ->
            [ "Denmark (Vikings)" ]

        "Fiji" ->
            [ "Nausori Cats"
            , "Raiwaqa Bulldogs"
            , "Suva City Swans"
            , "Suva Lions"
            ]

        "France" ->
            [ "Antony Blues"
            , "Blagnac Aviators"
            , "Bordeaux Bombers"
            , "Cergy-Pontoise Coyotes"
            , "Lyon ALFA Lions"
            , "Montpellier Fire Sharks"
            , "Paris Cockerels"
            , "Perpignan Tigers"
            , "Strasbourg Kangaroos"
            , "Toulouse Hawks"
            ]

        "Germany" ->
            [ "Frankfurt Redbacks"
            , "Munich Kangaroos"
            , "Berlin Crocodiles"
            , "Hamburg Dockers"
            , "Rheinland Lions"
            , "Stuttgart Emus"
            , "Dresden Wolves"
            , "Freiberg Taipans"
            ]

        "Japan" ->
            [ "Japan (Samurais)" ]

        "Kenya" ->
            [ "Kenya" ]

        "Lebanon" ->
            [ "Lebanon" ]

        "Nauru" ->
            [ "Nauru (Chiefs)" ]

        "Netherlands" ->
            [ "Netherlands" ]

        "New Zealand" ->
            [ "New Zealand (Falcons/Hawks)" ]

        "Papua New Guinea" ->
            [ "Papua New Guinea (Mosquitos)" ]

        "Poland" ->
            [ "Warsaw Boars"
            , "Warsaw Bison"
            , "Wrocław Lions Australian Rules Football Club"
            , "Fort Nysa Rugby Football Club"
            ]

        "Samoa" ->
            [ "Samoa (Bulldogs/Kangaroos)" ]

        "Scotland" ->
            [ "Edinburgh Bloods"
            , "Glasgow Sharks"
            , "Aberdeen Eagles"
            , "Kingdom Kangaroos"
            , "Glasgow Giants ARFC"
            , "Falkirk Silverbacks"
            , "West Lothian Eagles"
            ]

        "South Africa" ->
            [ "South Africa (Buffaloes/Lions)" ]

        "Spain" ->
            [ "Spain (Bulls)" ]

        "Sweden" ->
            [ "Sweden (Elks)" ]

        "South Korea" ->
            [ "South Korea" ]

        "Tonga" ->
            [ "Tonga (Black Marlins/Thunder/Storm)" ]

        "United Kingdom" ->
            [ "United Kingdom (Bulldogs)" ]

        "United States" ->
            [ "United States (Revolution/Freedom)" ]

        "Wales" ->
            [ "Wales (Red Dragons)" ]

        _ ->
            []
