module ViewUtils exposing (dotted, dottedGreen)

import Element exposing (rgb255)
import Element.Border as Border


dotted : List (Element.Attribute msg)
dotted =
    [ Border.width 2, Border.solid, Border.color (rgb255 255 0 0) ]


dottedGreen : List (Element.Attribute msg)
dottedGreen =
    [ Border.width 2, Border.solid, Border.color (rgb255 0 255 0) ]
