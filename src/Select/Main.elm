module Select.Main exposing (init, update, view, Model, Msg)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Quiz.Datatypes exposing (Msg(..), CardHead)
import CardList exposing (..)
import Select.Header as Header

type alias Model = List CardHead
type alias Msg = Quiz.Datatypes.Msg

--type Msg = ToNextScreen

init : Model
init = List.map (\x -> {name = x, check = False}) cardHeaders


view : Model -> Html Msg
view model = div [ class "lang-box" ]
                 [ div [] (List.map Header.view model)
                 , button [ onClick ToQuizScreen ] [ text "Start" ]
                 ]

update : Msg -> Model -> Model
update msg model = case msg of
                        Select card -> Header.updateHeads model card
                        _           -> model
