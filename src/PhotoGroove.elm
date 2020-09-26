module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)

urlPrefix = 
    "http://elm-in-action.com/"

view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
          -- List.map returns a list , has to put it in () otherwise it will be interpreted as 3 addional paramters to div
        , div [ id "thumbnails" ] (List.map 
                                    (\photo -> viewThumbnail model.selectedUrl photo)  model.photos
                                  ) 
        , img
            [
                class "large"
            ,   src (urlPrefix ++ "large/" ++ model.selectedUrl)
            ]
            []
        ]
viewThumbnail selectedUrl thumb =
    img
        [ src (urlPrefix ++ thumb.url)
        , classList [ ("selected", selectedUrl == thumb.url )]
        ]
        []

initialModel = {
    photos = 
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "1.jpeg"
    } 

main =
    view initialModel

