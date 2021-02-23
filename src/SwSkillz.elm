module SwSkillz exposing (..)

import Element exposing (centerX, column)
import ViewUtils exposing (paddedHeaderRow, subheader)


swSkillz =
    column [ centerX ]
        [ paddedHeaderRow [ subheader "Software skills" ]
        ]
