module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Datatypes exposing (..)
import Array

view : Card -> Html Msg
view card = let idn   = card.id
                idstr = String.fromInt idn
            in div [ class "card"
                   , class (viewAnswer card)
                   ]
                   [ span [] [ text card.face ]
                   , input [ id idstr, onFocus (Focus card), onInput Answer, disabled (disableInput card) ] []
                   , p [] [text (viewMessage card)]
                   ]

disableInput : Card -> Bool
disableInput card = case card.answered of
                         Correct -> True
                         _       -> False

viewAnswer : Card -> String
viewAnswer card = case card.answered of
                       Unanswered -> "unanswered"
                       Wrong      -> "wrong"
                       Correct    -> "correct"

viewMessage : Card -> String
viewMessage card = case card.answered of
                        Unanswered -> ""
                        Wrong      -> "Try again!"
                        Correct    -> "You got it!"

update : Card -> String -> Maybe Card
update card answer = let checkA : String -> List String -> Bool
                         checkA ans sols = List.any (\x -> x == ans) sols
                     in case answer of
                             "" -> Nothing
                             _  -> if card.answered == Correct then Nothing
                                   else ( if (checkA answer card.back) then Just { card | answered = Correct }
                                          else                              Just { card | answered = Wrong   }
                                        )

updateDeck : List Card -> Maybe Card -> List Card
updateDeck deck mcard = let changeCard swapC deckC = if deckC.id == swapC.id then swapC
                                                     else                         deckC
                        in case mcard of
                                Nothing   -> deck
                                Just card -> List.map (changeCard card) deck

getID : Maybe Card -> Int
getID mcard = case mcard of
                   Nothing   -> (-1)
                   Just card -> card.id

nextCard : Maybe Card -> List Card -> Maybe Card
nextCard mCard deck = mCard |> Maybe.andThen( \card -> if card.id > (List.length deck) then (List.head deck)
                                                       else        Array.get (card.id) (Array.fromList deck)
                                            )
