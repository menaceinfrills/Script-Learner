module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Datatypes exposing (..)

view : Card -> Html Msg
view card = let idn   = card.id
                idstr = String.fromInt idn
            in div [] [ h1 [] [ text card.face ]
                      , p [] [text (viewAnswer card)]
                      , input [ id idstr, onFocus (Focus card), onInput Answer ] []
                      ]

viewAnswer : Card -> String
viewAnswer card = case card.answered of
                       Unanswered -> "unanswered"
                       Wrong      -> "wrong"
                       Correct    -> "correct"

update : Card -> String -> Maybe Card
update card answer = case answer of
                          "" -> Nothing
                          _  -> if card.back answer then Just { card | answered = Correct }
                                else                     Just { card | answered = Wrong }

updateDeck : List Card -> Maybe Card -> List Card
updateDeck deck mcard = let changeCard swapC deckC = if deckC.id == swapC.id then swapC
                                                      else                         deckC
                        in case mcard of
                                Nothing   -> deck
                                Just card -> List.map (changeCard card) deck
