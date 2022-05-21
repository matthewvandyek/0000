module ReverseText exposing (..)
import Browser
import Html exposing (Html, h3, div, input, text, article)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { content : String
  }


init : Model
init =
  { content = "" }



-- UPDATE


type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
  div [ class "tile is-parent box is-vertical h-175 ml-5" ]
  [ h3 [] [ text "Exercise #2" ] 
  , article [ class "tile p-3 is-child" ]
    [ input [ class "input p-3 my-3 is-small is-primary", placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.fromInt (String.length model.content)) ]
    , div [] [ text (String.reverse model.content) ]
    ]
  ]



