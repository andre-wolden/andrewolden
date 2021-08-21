module ViewUtils.HtmlViewUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))


newTabLink : String -> String -> Html Msg
newTabLink link txt =
    a [ href link, target "_blank", rel "noreferrer noopener" ] [ text txt ]
