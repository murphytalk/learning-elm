module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser


urlPrefix : String
urlPrefix = 
    "http://elm-in-action.com/"

view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
          -- List.map returns a list , has to put it in () otherwise it will be interpreted as 3 addional paramters to div
        , div [ id "thumbnails" ] (List.map 
                                    -- partially applying : returns a function that takes one parameter which is one element from model.photos
                                    (viewThumbnail model.selectedUrl) 
                                    model.photos
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
        , onClick { desc = "clickedPhoto", data = thumb.url}
        ]
        []

initialModel : { photos : List { url : String }, selectedUrl : String }
initialModel = {
    photos = 
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "1.jpeg"
    } 

update msg model = 
    if msg.desc == "clickedPhoto" then
        { model | selectedUrl = msg.data}
    else
        model

main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

