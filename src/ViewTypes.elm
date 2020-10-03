module ViewTypes exposing (CvEntry)

import Element exposing (Element)
import Messages exposing (Msg)


type alias CvEntry =
    { year : String
    , title : String
    , subTitle : String
    , body : Element Msg
    }
