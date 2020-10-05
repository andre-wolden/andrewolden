module ViewTypes exposing (CvEntry, ViewData)

import Element exposing (Element)
import Messages exposing (Msg)


type alias CvEntry =
    { year : String
    , title : String
    , subTitle : String
    , body : Element Msg
    }


type alias ViewData =
    { w : Float
    , h : Float
    , y : Float
    , hMB : Float
    }
