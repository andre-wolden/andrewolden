module Data.CvEntries exposing (cvEntries)

import Element exposing (Element, fill)
import Maybe exposing (Maybe(..))
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
      , body =
            [ { title = "NAV - Sykdom i familien"
              , start = Just "2020-01"
              , end = Nothing
              , description = "Users can apply for different things by filling out forms."
              , technologies = Just [ "React", "Typescript", "Formik", "Sanity", "Gatsby", "fp-ts", "Kotlin", "Docker", "Kubernetes", "Github actions" ]
              , references =
                    Just
                        [ { title = "Sykdom i familien", description = "repository", link = "https://github.com/navikt/sykdom-i-familien" }
                        , { title = "Omsorgspenger kalkulator", description = "repository", link = "https://github.com/navikt/omsorgsdager-kalkulator" }
                        , { title = "Omsorgspenger for arbeidstaker", description = "repository", link = "https://github.com/navikt/omsorgspengerutbetaling-arbeidstaker-soknad" }
                        ]
              }
            , { title = "NAV - Digisos (Social Services)"
              , start = Just "2018-05"
              , end = Just "2019-12"
              , description = "Application form"
              , technologies = Just [ "React", "Typescript", "Redux", "Java", "Docker", "Kubernetes", "Circleci" ]
              , references =
                    Just
                        [ { title = "Sosialhjelp søknad", description = "repository", link = "https://github.com/navikt/sosialhjelp-soknad" }
                        , { title = "Sosialhjelp innsyn", description = "repository", link = "https://github.com/navikt/sosialhjelp-innsyn" }
                        , { title = "Innsyn test app", description = "repository", link = "https://github.com/navikt/sosialhjelp-woldena-tm" }
                        ]
              }
            , { title = "Statens Vegvesen - Datainn"
              , start = Just "2018-01"
              , end = Just "2018-03"
              , description = "Record traffic data, aggregations and data display"
              , technologies = Just [ "Akka", "Elasticsearch", "Java", "React", "AngularJS" ]
              , references = Nothing
              }
            ]
      }
    , { year = "2012 - 2017"
      , title = "TechnipFMC (former FMC Technologies)"
      , subTitle = "(From August 2012 to December 2017)"
      , body =
            [ { title = "Product Engineer - Subsea 2.0 Control System"
              , start = Just "2014-05"
              , end = Just "2014-05"
              , description = "Prototyping of the next generation subsea electronic module"
              , technologies = Nothing
              , references =
                    Nothing
              }
            , { title = "Product Engineer - Riser Monitoring Systems"
              , start = Just "2014-05"
              , end = Just "2014-05"
              , description = "On site testing of strain gauge systems and inclinometers. Calibration of sensors by use of obtained testdata."
              , technologies = Just [ "Matlab", "Python" ]
              , references =
                    Nothing
              }
            , { title = "Graduate Enginner / Trainee Program"
              , start = Just "2012-08"
              , end = Just "2014-05"
              , description = "With about 20 000 employes at the time spread around 3+ locations the program was designed to give graduates an effective introduction to the company. During the second year I mainly worked with the flow assurance department (fluid and thermo related) and the riser monitoring department"
              , technologies = Just [ "Ansys", "Matlab", "Python" ]
              , references =
                    Nothing
              }
            ]
      }
    , { year = "2007 - 2012"
      , title = "NTNU / Kaist"
      , subTitle = "(From August 2007 to July 2012)"
      , body =
            [ { title = "KAIST"
              , start = Just "2012-01"
              , end = Just "2012-06"
              , description = "Master's Thesis working for the Multiphase Flow Lab at KAIST (Korea Advanced Institute of Science and Technology)"
              , technologies = Just [ "Matlab" ]
              , references =
                    Just
                        [ { title = "Master's Thesis"
                          , description = "Evaluation of Split Ratio for Plug Flow at a Meso-Scale T-Junction"
                          , link = "https://ntnuopen.ntnu.no/ntnu-xmlui/bitstream/handle/11250/234896/566557_FULLTEXT01.pdf?sequence=2"
                          }
                        ]
              }
            , { title = "NTNU"
              , start = Just "2011-12"
              , end = Just "2011-08"
              , description = "Multiphase flow, Project on analyzing plug length for two-phase flow."
              , technologies = Just [ "Matlab" ]
              , references =
                    Nothing
              }
            , { title = "KAIST (exchange student)"
              , start = Just "2011-06"
              , end = Just "2010-08"
              , description = "Viscous flow, computational fluid dynamics, turbulent flow, aerodynamics"
              , technologies = Just [ "Matlab" ]
              , references =
                    Nothing
              }
            , { title = "NTNU"
              , start = Just "2007-08"
              , end = Just "2010-06"
              , description = "Introduction courses for mechanical engineering. Specialize in the field of thermo and fluid dynamics"
              , technologies = Just [ "Matlab" ]
              , references =
                    Nothing
              }
            ]
      }
    ]
