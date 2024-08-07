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
                       --, subscriptions = subscriptions
                       }

--Datatype
type alias Model = { selected : Maybe String
                   , ids      : List String
                   }

type Msg = NoOp
         --| QueryActive
         --| ReceiveActive (Maybe String)
         | Focus (Maybe String)

--Init
init : Model--, Cmd Msg )
init =  initialModel--, Cmd.none )

initialModel : Model
initialModel = { selected = Nothing
               , ids      = List.map String.fromInt (List.range 1 10) }

-- Update
update : Msg -> Model -> Model--( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp                   -> model
        --QueryActive            -> ( model, queryActiveFromDOM () )
        --ReceiveActive selected -> ( { model | selected = selected }, Cmd.none )
        Focus (Just selected)  -> { model | selected = Just selected }--, Cmd.none )--( model,  Cmd.batch [Task.attempt (always NoOp) (Browser.Dom.focus selected), queryActiveFromDOM ()] )
        Focus Nothing          -> { model | selected = Nothing }--, Cmd.none )--queryActiveFromDOM () )

-- Vie
view : Model -> Html Msg
view model = div [] [ div [] [ text ("Currently selected: " ++ (Maybe.withDefault "" model.selected)) ]
                    , div [] (List.map viewButton model.ids)
                    , div [] (List.map viewInput model.ids)
                    ]

viewButton : String -> Html Msg
viewButton id = button [ onClick (Focus (Just id)) ] [ text id ]

viewInput : String -> Html Msg
viewInput idstr = div [] [ input [ id idstr, placeholder idstr, onFocus (Focus (Just idstr)) ] [] ]--QueryActive ] [] ]

--port sendActiveToElm : (Maybe String -> msg) -> Sub msg

--port queryActiveFromDOM : () -> Cmd msg

--subscriptions : Model -> Sub Msg
--subscriptions _ = sendActiveToElm ReceiveActive
