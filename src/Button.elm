module Button exposing (main)


import Browser
import Html exposing (Html, p, div, h2, h3, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing(onClick)
import Random

main : Program () Int Msg
main = 
    Browser.sandbox
    { init = init
    , update = update
    , view = view
    }



-- MODEL
init = 0

-- VIEW
view : Int -> Html Msg
view model = 
    div [ class "hero is-primary" ]
    [div [class "hero-body columns is-vcentered"]
        [ div [ class "column" ] 
            [ h2 [ class "title is-1"] [ text (String.fromInt model) ]
            , div [ class "buttons" ]
                [ button [ class "button", onClick Increment ] [ text "+" ]
                , button [ class "button", onClick Decrement ] [ text "-" ]
                , button [ class "button", onClick Nucrement ] [ text "reset" ]
                ]
            , div [ class "buttons" ]
                [ button [ class "button", onClick Sucrement ] [ text "?" ]
                , button [ class "button", onClick Bicrement ] [ text "X" ]
                , button [ class "button", onClick Wecrement ] [ text "ùwú" ]
                ]
            ]
        , div [ class "column is-two-thirds" ]
            [ h2 [ class "title is-5" ] [text "Exercise #1"]
            , p []
                [ text "The main value is special in Elm. It describes what gets shown on screen. In this case, we are going to initialize our application with the init value, the view function is going to show everything on screen, and user input is going to be fed into the update function."
                ]
            ]
        ]
    ]





type Msg = 
    Increment | Decrement | Nucrement | Sucrement | Bicrement | Wecrement

hasher1 = 9124
hasher2 = 111111

remmer a n =
    a - n * (a // n)

update : Msg -> Int -> Int
update msg model = -- TAKES IN A MESSAGE AND A CURRENT MODEL, AND RETURNS A NEW MODEL
    case msg of
        Increment -> model + 1
        Decrement -> model - 1
        Nucrement -> 0
        Sucrement ->
            if model > hasher1 then
                remmer model hasher1
            else
                remmer model hasher2
        Bicrement -> model * 2
        Wecrement -> model^3 + model^2 + 2^(model//hasher1)