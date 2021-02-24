module SwSkillz exposing (..)

import Element exposing (centerX, column)
import ViewUtils exposing (centeredSectionHeader, paddedHeaderRow)


swSkillz =
    column [ centerX ]
        [ paddedHeaderRow [ centeredSectionHeader "Software skills" ]
        ]
