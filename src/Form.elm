module Form exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }


init : Model
init =
  Model "" "" ""



-- UPDATE


type Msg
  = Name String
  | Password String
  | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }



-- VIEW


view : Model -> Html Msg
view model =
  div [ class "tile is-parent box is-vertical h-175 mx-5" ]
  [ h3 [] [ text "Exercise #3" ] 
  , article [ class "tile p-3 is-child" ]
    [ div []
        [ viewInput "text" "Name" model.name Name
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
        , viewValidation model
        ]
    ]
  ]



viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ class "input m-1 is-small is-info", type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if String.isEmpty model.name || String.isEmpty model.password|| String.isEmpty model.passwordAgain then
        div [ style "color" "gray" ] [ text "Please input your information." ]
    else if String.length model.password < 8 then
        div [ style "color" "orange" ] [ text "Password needs at least 8 characters." ]
    else if hasNoNumbers model.password then 
        div [ style "color" "orange" ] [ text "Password needs at least one digit." ]
    else if (String.toLower model.password) == model.password then
        div [ style "color" "orange" ] [ text "Password needs at least one upper case character." ]
    else if (String.toUpper model.password) == model.password then
        div [ style "color" "orange" ] [ text "Password needs at least one lower case character." ]
    else if model.password /= model.passwordAgain then
        div [ style "color" "red" ] [ text "Passwords must match." ]
    else
        div [ style "color" "green" ] [ text "[OK]"]




hasNoNumbers : String -> Bool
hasNoNumbers word =
    if String.isEmpty (String.filter Char.isDigit word) then 
        True
    else
        False