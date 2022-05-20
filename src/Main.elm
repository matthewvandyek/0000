module Main exposing (main)

import Browser
import Html exposing (Html, div, h2, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing(onClick)


main : Program () Int Msg
main = 
    Browser.sandbox
    { init = initialModel
    , update = update
    , view = view
    }

initialModel : Int
initialModel =
    100

view : Int -> Html Msg
view model = 
    div [ class "hero is-primary" ]
    [ div [class "hero-body"]
        [ h2 [ class "title is-1"] [ text (String.fromInt model) ]
        , div [ class "buttons" ]
            [ button [class "button", onClick Increment ] [ text "+" ]
            , button [class "button", onClick Decrement ] [ text "-" ]
            , button [class "button", onClick Nucrement ] [ text "reset" ]
            ]
        ]
    ]




type Msg = Increment | Decrement | Nucrement

update : Msg -> Int -> Int
update msg model = -- TAKES IN A MESSAGE AND A CURRENT MODEL, AND RETURNS A NEW MODEL
    case msg of
        Increment -> model + 1
        Decrement -> model - 1
        Nucrement -> 100