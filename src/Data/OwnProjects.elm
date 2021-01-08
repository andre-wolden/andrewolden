module Data.OwnProjects exposing (..)

import ViewTypes exposing (ProjectDescription)


ownProjectsTitle =
    "Own Projects"


minesweeperDescription : ProjectDescription
minesweeperDescription =
    { title = "Minesweeper"
    , start = Nothing
    , end = Nothing
    , description = "A remake of the legendary minesweeper game in elm. Just for fun, since I like the game, and to practice Elm. Currently hosted by ...TBD"
    , technologies = Just [ "Elm", "Build and Hosting tech TBD" ]
    , references =
        Just
            [ { title = "Minesweeper"
              , description = "Play it"
              , link = "TBD"
              }
            , { title = "Blog post"
              , description = "A short article posted at the Bekk Functional Christmas Calendar"
              , link = "https://functional.christmas/2019/4"
              }
            ]
    }


hobbyLoggerDescription : ProjectDescription
hobbyLoggerDescription =
    { title = "Hobby Logger"
    , start = Nothing
    , end = Nothing
    , description = "I get satisfied at the end of the day if I actually practiced one of my hobbies that day. For example Korean, or if I exercised. Or if I got in some quality coding of course. I use this application to record which days I practiced one of my defined hobby-skills. But the main purpose for the app is actually just to practice all aspects of the tech-stack."
    , technologies = Just [ "Elm", "Build and Hosting tech TBD", "Kotlin", "Gradle", "Docker", "Postgresql" ]
    , references =
        Just
            [ { title = "Hobby Logger"
              , description = "Use it to log what you are doing each day. If I have been doing good for a while then looking at the log makes me happy ^"
              , link = "TBD"
              }
            ]
    }


myProjects : List ProjectDescription
myProjects =
    [ minesweeperDescription, hobbyLoggerDescription ]
