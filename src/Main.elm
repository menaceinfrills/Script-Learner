module Main exposing (main)

import Browser
import Html exposing (..)
import Quiz.Main as Quiz
import Select.Main as Select
import Quiz.Datatypes exposing (Msg(..))

main : Program () Model Msg
main = Browser.sandbox { init = init
                       , view = view
                       , update = update
                       }

type alias Model = Substate
type alias Msg = Quiz.Datatypes.Msg

--type Screen = Quiz
--            | Select
           -- | Results

type Substate = QuizS Quiz.Model
              | SelectS Select.Model

--type Msg = QuizMsg (Quiz.Msg)
--         | SelectMsg (Select.Msg)

init : Model
init = SelectS Select.init

view : Model -> Html Msg
view model = case model of
                  QuizS state -> (Quiz.view state)
                  SelectS state -> (Select.view state)

update : Msg -> Model -> Model
update msg model = case msg of
                   ToNextScreen -> QuizS Quiz.init
                   _ -> case model of
                        QuizS state   -> QuizS (Quiz.update msg state)
                        SelectS state -> SelectS (Select.update msg state)
