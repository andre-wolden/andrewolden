module Components.Burger exposing (burger)

import Html exposing (Html, a, div, li, text, ul)
import Html.Attributes exposing (href)
import Messages exposing (Msg(..))


burger : Html Msg
burger =
    ul []
        [ li [] [ a [ href "/intro" ] [ text "intro" ] ]
        , li [] [ a [ href "/resume" ] [ text "resume" ] ]
        , li [] [ a [ href "/personal-projects" ] [ text "personal projects" ] ]
        ]
