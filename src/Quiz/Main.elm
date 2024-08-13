module Quiz.Main exposing (init, update, view, Model, Msg)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe
import Quiz.Card as Card
import Quiz.Datatypes exposing (..)
import Quiz.Init as I
import CardList exposing (..)

type alias Model = { answer : String
                   , select : Maybe Card
                   , deck   : List Card
                   }

type alias Msg = Quiz.Datatypes.Msg

--Init
init : List CardHead -> Model
init heads = { answer = ""
             , select = Maybe.Nothing
             , deck = I.initCards <| listFromHeaders <| heads
             }

-- Update
update : Msg -> Model -> Model
update msg model = let newCard = case model.select of
                                      Nothing   -> model.select
                                      Just card -> Card.update card model.answer
                   in case msg of
                           Focus card    -> if card.id == (Card.getID model.select) then model
                                            else                              { model | select = Just card, deck = Card.updateDeck model.deck newCard, answer = "" }
                           Answer answer -> { model | answer = answer }
                           _ -> model

-- View
view : Model -> Html Msg
view model = let idstr = Maybe.withDefault "" <| Maybe.map (String.fromInt << .id) <| model.select
             in div [] [ div [ class "card-box" ] (List.map Card.view model.deck)
                       --, div [] [ text ("Currently selected: " ++ idstr) ]
                       ]
