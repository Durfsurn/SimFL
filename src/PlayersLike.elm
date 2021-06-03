module PlayersLike exposing (..)

import Player exposing (..)
import Positions exposing (..)


playerLike : Player -> List String
playerLike p =
    List.map (\( _, _, n ) -> n) <|
        List.filter
            (\( h, w, _ ) ->
                (h <= p.height + 5 && h >= p.height - 5)
                    && (w <= p.weight + 5 && w >= p.weight - 5)
            )
        <|
            case positionFromString p.position of
                SmallForward ->
                    [ ( 174, 80, "Jeff Farmer" )
                    , ( 175, 75, "Silvio Foschini" )
                    , ( 179, 78, "Vin Catoggio" )
                    , ( 177, 78, "Norm Goss" )
                    , ( 177, 80, "Leon Davis" )
                    , ( 184, 78, "Angus Monfries" )
                    , ( 171, 76, "Phillip Matera" )
                    , ( 174, 74, "Eddie Betts" )
                    , ( 179, 84, "Brett Ebert" )
                    , ( 176, 83, "Stephen Milne" )
                    , ( 173, 79, "Hayden Ballantyne" )
                    , ( 176, 75, "Michael Walters" )
                    , ( 176, 78, "Relton Roberts" )
                    , ( 170, 74, "Brett Daniels" )
                    , ( 170, 67, "Kysaiah Pickett" )
                    , ( 171, 77, "Anthony McDonald-Tipungwuti" )
                    ]

                MediumForward ->
                    [ ( 182, 87, "Brad Johnson" )
                    , ( 183, 80, "Mark LeCras" )
                    , ( 184, 88, "Clive Waterhouse" )
                    , ( 185, 80, "John Coleman" )
                    , ( 183, 85, "Gordon Coventry" )
                    , ( 180, 76, "Bob Pratt" )
                    , ( 175, 65, "Jack Titus" )
                    , ( 178, 62, "Jack Moriarty" )
                    , ( 182, 80, "Bill Mohr" )
                    , ( 183, 80, "Harry Vallence" )
                    , ( 175, 76, "Dick Lee" )
                    , ( 173, 66, "George Doig" )
                    , ( 183, 80, "Geoff Blethyn" )
                    , ( 182, 84, "Alex Jesaulenko" )
                    ]

                KeyForward ->
                    [ ( 188, 92, "Peter Hudson" )
                    , ( 188, 104, "Jason Dunstall" )
                    , ( 191, 123, "Tony Lockett" )
                    , ( 188, 102, "Doug Wade" )
                    , ( 185, 97, "Gary Ablett Sr" )
                    , ( 193, 102, "Fred Fanning" )
                    , ( 191, 87, "Peter McKenna" )
                    , ( 191, 85, "Michael Moncrieff" )
                    , ( 193, 97, "Alastair Lynch" )
                    , ( 192, 92, "Matthew Lloyd" )
                    , ( 188, 95, "Tony Modra" )
                    , ( 196, 119, "Saverio Rocca" )
                    , ( 191, 100, "Brendan Fevola" )
                    , ( 194, 104, "Barry Hall" )
                    , ( 192, 97, "Wayne Carey" )
                    , ( 193, 97, "Bernie Quinlan" )
                    , ( 188, 89, "Terry Daniher" )
                    , ( 193, 92, "Nick Riewoldt" )
                    , ( 193, 92, "Jack Riewoldt" )
                    , ( 193, 96, "Gary Lyon" )
                    , ( 186, 93, "Dermott Brereton" )
                    , ( 196, 104, "Josh J Kennedy" )
                    , ( 197, 103, "Matthew Richardson" )
                    , ( 195, 103, "Jonathon Brown" )
                    , ( 199, 105, "Lance Franklin" )
                    , ( 194, 102, "Taylor Walker" )
                    , ( 194, 96, "Warren Tredrea" )
                    , ( 192, 99, "Matthew Pavlich" )
                    ]

                Ruckman ->
                    [ ( 189, 94, "Sam Newman" )
                    , ( 191, 94, "Polly Farmer" )
                    , ( 189, 105, "John Nicholls" )
                    , ( 200, 104, "Mike Pyke" )
                    , ( 188, 98, "Noel Teasdale" )
                    , ( 197, 100, "Gary Dempsey" )
                    , ( 190, 89, "Don Scott" )
                    , ( 198, 97, "Peter Moore" )
                    , ( 193, 108, "Barry Round" )
                    , ( 198, 99, "Simon Madden" )
                    , ( 206, 107, "Justin Madden" )
                    , ( 194, 95, "Peter Carey" )
                    , ( 199, 99, "Jim Stynes" )
                    , ( 203, 106, "Shaun Rehn" )
                    , ( 201, 108, "Scott Wynd" )
                    , ( 195, 95, "Jeff White" )
                    , ( 206, 112, "Paul Salmon" )
                    , ( 202, 106, "Brad Ottens" )
                    , ( 203, 103, "Peter Everitt" )
                    , ( 204, 107, "Dean Cox" )
                    , ( 211, 119, "Aaron Sandilands" )
                    , ( 201, 110, "Nic Naitanui" )
                    , ( 208, 108, "Max Gawn" )
                    ]

                RoverOnballer ->
                    [ ( 179, 73, "Haydn Bunton Sr" )
                    , ( 163, 78, "Tony Liberatore" )
                    , ( 175, 81, "Allan La Fontaine" )
                    , ( 179, 82, "Dick Reynolds" )
                    , ( 178, 88, "Des Fothergill" )
                    , ( 174, 80, "Allen Aylett" )
                    , ( 179, 87, "Ron Barassi Jr" )
                    , ( 171, 76, "Bob Skilton" )
                    , ( 175, 78, "Jack Clarke" )
                    , ( 179, 81, "Ian Stewart" )
                    , ( 178, 74, "Bob Rose" )
                    , ( 180, 84, "Des Tuddenham" )
                    , ( 168, 70, "Barry Cable" )
                    , ( 175, 71, "Kevin Bartlett" )
                    , ( 178, 86, "Leigh Matthews" )
                    , ( 176, 85, "Maurice Rioli" )
                    , ( 179, 74, "Wayne Schimmelbusch" )
                    , ( 188, 76, "Michael Tuck" )
                    , ( 185, 96, "Tim Watson" )
                    , ( 167, 67, "Jim Krakouer" )
                    , ( 170, 70, "John Platten" )
                    , ( 180, 81, "Craig Bradley" )
                    , ( 176, 88, "Greg Williams" )
                    , ( 182, 92, "Chris McDermmott" )
                    , ( 179, 83, "Paul Kelly" )
                    , ( 181, 84, "Robert Harvey" )
                    , ( 193, 88, "Michael Voss" )
                    , ( 184, 93, "Mark Ricciuto" )
                    , ( 186, 91, "Nathan Buckley" )
                    , ( 174, 80, "Shane Crawford" )
                    , ( 178, 80, "Scott West" )
                    , ( 185, 81, "Simon Black" )
                    , ( 182, 87, "Gary Ablett Jr" )
                    , ( 188, 87, "Nigel Lappin" )
                    , ( 189, 88, "Chris Judd" )
                    , ( 186, 92, "Luke Hodge" )
                    , ( 187, 89, "Jimmy Bartel" )
                    , ( 185, 93, "Dane Swan" )
                    , ( 191, 91, "Scott Pendlebury" )
                    , ( 183, 84, "Joel Selwood" )
                    , ( 189, 96, "Patrick Dangerfield" )
                    , ( 179, 78, "Ben Cousins" )
                    , ( 192, 96, "Nat Fyfe" )
                    , ( 187, 93, "Dustin Martin" )
                    , ( 185, 86, "Trent Cotchin" )
                    , ( 189, 95, "Josh P Kennedy" )
                    ]

                Winger ->
                    []

                SmallDefender ->
                    [ ( 168, 72, "Caleb Daniel" )
                    ]

                MediumDefender ->
                    []

                KeyDefender ->
                    []
