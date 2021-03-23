module ViewUtils.ViewExamples exposing (..)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))


exactSizeBox : Html Msg
exactSizeBox =
    div [ class "example-component" ]
        [ span [] [ text "Her kommer det en firkanta boks med tekst og nøyaktig height 400 og width 75" ]
        ]
