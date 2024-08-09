module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe
import Card
import Datatypes exposing (..)
import Init as I

main : Program () Model Msg
main = Browser.sandbox { view   = view
                       , init   = init
                       , update = update
                       }

--Init
init : Model
init = { answer = ""
       , selected = Maybe.Nothing
       , previous = Maybe.Nothing
       , deck = I.initCards I.cardList
       }

-- Update
update : Msg -> Model -> Model
update msg model = case msg of
                        Focus card  -> { model | previous = model.selected, selected = Just card }

-- View
view : Model -> Html Msg
view model = let idstr = Maybe.withDefault "" <| Maybe.map (String.fromInt << .id) <| model.selected
             in div [] [ div [] (List.map Card.view model.deck)
                       , div [] [ text ("Currently selected: " ++ idstr) ]
                       ]
