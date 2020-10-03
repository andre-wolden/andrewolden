module View exposing (..)

import Browser.Dom exposing (Viewport)
import Cv exposing (cv)
import CvEntries exposing (cvEntries)
import Element exposing (Element, alignLeft, centerX, centerY, clip, column, el, fill, htmlAttribute, maximum, padding, paragraph, px, rgb255, row, spacing)
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input exposing (Label, labelAbove)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))
import Model exposing (Model)
import TitleRow exposing (getTitleRow)
import Types exposing (ScreenWidth)
import Utils exposing (stringToNoop)
import ViewConstants exposing (maxContentWidth)
import ViewportAndSceneUtils exposing (viewportToScreenWidth)


view : Model -> Html Msg
view model =
    case model.viewport of
        Nothing ->
            Element.layout [] Element.none

        Just viewport ->
            Element.layout (textFont ++ dottedGreen)
                (column ([ Element.width (fill |> maximum maxContentWidth), centerX ] ++ dotted)
                    [ getTitleRow viewport
                    , pictureRow
                    , introductionTextRow (viewportToScreenWidth viewport)
                    , Element.image [ centerX ] { description = "Link to gitlab site", src = "/images/gitlab-color.jpg" }
                    , Element.image [ centerX, Element.width fill ] { description = "Link to github site", src = "/images/mark-github-512.png" }
                    , cv cvEntries

                    --, debugSizeValuesRow viewport
                    ]
                )


focusSearchFieldButton : Element Msg
focusSearchFieldButton =
    Input.button [] { onPress = Just FocusSearchField, label = Element.text "Go to search button" }


searchInput : Element Msg
searchInput =
    Input.text [ htmlAttribute (id "search-box") ] { onChange = stringToNoop, label = labelAbove [] (Element.text "input felt"), placeholder = Nothing, text = "Ikke mulig å skrive noe her ennå." }


dotted : List (Element.Attribute msg)
dotted =
    [ Border.width 2, Border.solid, Border.color (rgb255 255 0 0) ]


dottedGreen : List (Element.Attribute msg)
dottedGreen =
    [ Border.width 2, Border.solid, Border.color (rgb255 0 255 0) ]


textFont : List (Element.Attribute msg)
textFont =
    [ Font.color (Element.rgb 0 0 0)
    , Font.size 16
    , Font.family
        [ Font.typeface "Courier New"
        , Font.sansSerif
        ]
    ]


viewportToString : Viewport -> String
viewportToString viewport =
    "Viewport values: " ++ String.fromFloat viewport.viewport.width


debugSizeValuesRow : Viewport -> Element msg
debugSizeValuesRow viewport =
    row ([ Element.width fill ] ++ dotted)
        [ el [ alignLeft, centerY ] (Element.text (viewportToString viewport))
        ]


pictureRadius : Int
pictureRadius =
    120


pictureDiameter : Int
pictureDiameter =
    2 * pictureRadius


pictureRow : Element msg
pictureRow =
    row [ Element.width fill, centerY, spacing 30 ]
        [ Element.image [ clip, centerX, Border.rounded pictureRadius, Element.height (px pictureDiameter), Element.width (px pictureDiameter) ] { description = "Picture of me.", src = "/images/4.jpg" }
        ]



--Element.textColumn [ spacing 10, padding 10 ]
--        [ paragraph [] [ text "lots of text ...." ]
--        , el [ alignLeft ] none
--        , paragraph [] [ text "lots of text ...." ]
--        ]


introductionTextRow : ScreenWidth -> Element msg
introductionTextRow screenWidth =
    row
        [ Element.width fill ]
        [ paragraph [ centerX, padding 24, Font.justify ] [ Element.text introtext ]
        ]



--[ Element.textColumn [ paddingXY 30 0, Element.width (fill |> maximum (maxParagraphWidth screenWidth)) ]
--    [ paragraph [ paddingXY 24 24, Font.justify, Element.width (fill |> maximum 300) ] [ Element.text introtext ]
--    ]
--]


introtext =
    "I am a highly dedicated nerd. I work as a software developer. In my spare time I do basically two things. I spend time with my family, or do some nerd activity. Which usually means practice coding, math or korean."
