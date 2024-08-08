module Main exposing (main)

import Browser
import Browser.Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe
import Task


main : Program () Model Msg
main = Browser.sandbox { view          = view
                       , init          = init
                       , update        = update
                       }

--Datatype
type alias Model = { selected : Maybe String
                   , ids      : List String
                   }

type Msg = NoOp
         | Focus (Maybe String)

--Init
init : Model
init =  initialModel

initialModel : Model
initialModel = { selected = Nothing
               , ids      = List.map String.fromInt (List.range 1 10) }

-- Update
update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp                   -> model
        Focus (Just selected)  -> { model | selected = Just selected }
        Focus Nothing          -> { model | selected = Nothing }

-- View
view : Model -> Html Msg
view model = div [] [ div [] [ text ("Currently selected: " ++ (Maybe.withDefault "" model.selected)) ]
                    , div [] (List.map viewButton model.ids)
                    , div [] (List.map viewInput model.ids)
                    ]

viewButton : String -> Html Msg
viewButton id = button [ onClick (Focus (Just id)) ] [ text id ]

viewInput : String -> Html Msg
viewInput idstr = div [] [ input [ id idstr, placeholder idstr, onFocus (Focus (Just idstr)) ] [] ]
