module Main exposing (main)

import Browser
import Quiz.Quiz as Quiz
import Html exposing (..)

main : Program () Model Msg
main = Browser.sandbox { init = init
                       , view = view
                       , update = update
                       }

type alias Model = { screen   : Screen
                   , substate : Substate
                   }

type Screen = Quiz
           -- | Selection
           -- | Results

type alias Substate = Quiz.Model

type alias Msg = Quiz.Msg

init : Model
init = { screen = Quiz, substate = Quiz.init }

view : Model -> Html Msg
view model = case model.screen of
                  Quiz -> Quiz.view model.substate

update : Msg -> Model -> Model
update msg model = { model | substate = Quiz.update msg model.substate }
