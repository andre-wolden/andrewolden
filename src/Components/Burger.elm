module Components.Burger exposing (burger)

import Element exposing (Element, el, text)
import Element.Font as Font
import Messages exposing (Msg(..))


burger : Element Msg
burger =
    el [ Font.size 100 ] ("BURGER" |> text)
