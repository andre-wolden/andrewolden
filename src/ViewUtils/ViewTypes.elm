module ViewUtils.ViewTypes exposing (..)


type alias Reference =
    { title : String
    , description : String
    , link : String
    }


type alias ProjectDescription =
    { title : String
    , start : Maybe String
    , end : Maybe String
    , description : String
    , technologies : Maybe (List String)
    , references : Maybe (List Reference)
    }


type alias CvEntry =
    { year : String
    , title : String
    , subTitle : String
    , body : List ProjectDescription
    }


type alias ViewData =
    { w : Float
    , h : Float
    , y : Float
    , hMB : Float
    , hMBMin : Float
    }


type alias FontSizeFunc =
    Float -> Float -> Float
