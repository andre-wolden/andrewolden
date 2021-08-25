module Components.Burger exposing (backToIntroPage, burger)

import Html exposing (Html, a, div, i, li, text, ul)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))


burger : Html Msg
burger =
    ul []
        [ li [] [ a [ href "/" ] [ text "Back" ] ]
        , li [] [ a [ href "/resume" ] [ text "resume" ] ]
        , li [] [ a [ href "/personal-projects" ] [ text "personal projects" ] ]
        ]


backToIntroPage : Html Msg
backToIntroPage =
    div []
        [ i [ class "fa fa-long-arrow-left" ] []
        , a [ href "/" ] [ text "Back" ]
        ]
