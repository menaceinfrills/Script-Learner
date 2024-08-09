module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Datatypes exposing (..)

view : Card -> Html Msg
view card = let idn   = card.id
                idstr = String.fromInt idn
            in div [] [ h1 [] [ text card.face ]
                      , input [ id idstr, onFocus (Focus card)] []
                      ]

update : Card -> String -> Card
update card answer = case answer of
                          "" -> { card | answered = Unanswered }
                          _  -> case card.back answer of
                                     True  -> { card | answered = Correct }
                                     False -> { card | answered = Wrong }
