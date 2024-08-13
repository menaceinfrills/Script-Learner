module Select.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Quiz.Datatypes exposing (Msg(..), CardHead)

view : CardHead -> Html Msg
view head = label [ class "select-box", class (checkfn head.check) ]
                  [ input [type_ "checkbox", onCheck (\x -> Select { head | check = x }) ] []
                  , p [] [ text head.name ]
                  ]

checkfn : Bool -> String
checkfn checked = if checked then "check"
                  else            ""

updateHeads : List CardHead -> CardHead -> List CardHead
updateHeads deck card = let changeCard swapC deckC = if deckC.name == swapC.name then swapC
                                                     else                         deckC
                        in List.map (changeCard card) deck
