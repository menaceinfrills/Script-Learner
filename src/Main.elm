module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe
import Card
import Datatypes as D
import Init as I

main : Program () D.Model D.Msg
main = Browser.sandbox { view          = view
                       , init          = init
                       , update        = update
                       }

--Init
init : D.Model
init = I.initCards I.cardList

-- Update
update : D.Msg -> D.Model -> D.Model
update msg model = case msg of
                   D.Focus id  -> { model | selected = Just id }

-- View
view : D.Model -> Html D.Msg
view model = let idstr = Maybe.withDefault "" <| Maybe.map String.fromInt <| model.selected
             in div [] [ div [] (List.map Card.view model.ids)
                       , div [] [ text ("Currently selected: " ++ idstr) ]
                       ]
