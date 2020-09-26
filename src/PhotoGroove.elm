module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)

urlPrefix = 
    "http://elm-in-action.com/"
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ] (List.map viewThumbnail model) -- List.map returns a list , has to put it in () otherwise it will be interpreted as 3 addional paramters to div
        ]
viewThumbnail thumb =
    img [ src (urlPrefix ++ thumb.url) ] []

initialModel =
    [ { url = "1.jpeg" }
    , { url = "2.jpeg" }
    , { url = "3.jpeg" }
    ]

main =
    view initialModel

