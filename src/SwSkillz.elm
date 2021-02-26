module SwSkillz exposing (..)

import Element exposing (column, fill, padding, paragraph, text, width)
import ViewUtils.ViewUtils exposing (centeredSectionHeader)


swSkillz =
    column [ width fill ]
        [ centeredSectionHeader "Competency"
        , paragraph [ padding 24 ] [ text "Frontend" ]
        , paragraph [ padding 24 ] [ text "React, Redux, Typescript, fp-ts, Elm" ]
        , paragraph [ padding 24 ] [ text "Backend" ]
        , paragraph [ padding 24 ] [ text "Kotlin, Java, Node" ]
        , paragraph [ padding 24 ] [ text "Tools and Platforms" ]
        , paragraph [ padding 24 ] [ text "Webpack, npm, Postgresql, Docker, Kubernetes, Flyway, Heroku, GCP, Nginx, Maven, Gradle, Grafana, Kibana, Ruby on Rails, Python, Ansible" ]
        ]
