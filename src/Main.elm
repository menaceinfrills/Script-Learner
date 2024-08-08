module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe

main : Program () Model Msg
main = Browser.sandbox { view          = view
                       , init          = init
                       , update        = update
                       }

--Datatypes
type alias Model = { selected : Maybe Int
                   , ids      : List Int
                   }

type Msg = Focus Int

--Init
init : Model
init = { selected = Nothing
       , ids      = (List.range 1 10) }

-- Update
update : Msg -> Model -> Model
update msg model = case msg of
                   Focus id  -> { model | selected = Just id }

-- View
view : Model -> Html Msg
view model = div [] [ div [] (List.map viewInput model.ids)
                    , div [] [ text ("Currently selected: " ++ (showID model.selected)) ]
                    ]

showID : Maybe Int -> String
showID arg = Maybe.withDefault ""<| Maybe.map String.fromInt <| arg

viewInput : Int -> Html Msg
viewInput idn = let idstr = String.fromInt idn
                in div [] [ input [ id idstr, placeholder idstr, onFocus (Focus idn) ] [] ]
