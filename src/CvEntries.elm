module CvEntries exposing (cvEntries)

import Element exposing (Element, fill)
import Messages exposing (Msg)
import ViewTypes exposing (CvEntry)


ntnuBody : Element Msg
ntnuBody =
    Element.paragraph [ Element.width fill ] [ Element.text "Her kommer body teksten til NTNU entry'en" ]


fmcBody : Element Msg
fmcBody =
    Element.paragraph [ Element.width fill ] [ Element.text "Her kommer body teksten til FMC entry'en" ]


bekkBody : Element Msg
bekkBody =
    Element.paragraph [ Element.width fill ] [ Element.text "Her kommer body teksten til Bekk entry'en" ]


cvEntries : List CvEntry
cvEntries =
    [ { year = "2018 - still here"
      , title = "Bekk"
      , subTitle = "(From January 2018. Still working here :))"
      , body = bekkBody
      }
    , { year = "2012 - 2017"
      , title = "TechnipFMC (former FMC Technologies)"
      , subTitle = "(From August 2012 to December 2017)"
      , body = fmcBody
      }
    , { year = "2007 - 2012"
      , title = "NTNU / Kaist"
      , subTitle = "(From August 2007 to July 2012)"
      , body = ntnuBody
      }
    ]
