module Datatypes exposing (..)

type Msg = Focus Card

type alias Model = { answer : String
                   , selected : Maybe Card
                   , previous : Maybe Card
                   , deck    : List Card
                   }

type alias Card = { id       : Int
                  , face     : Face
                  , back     : Back
                  , answered : Answer
                  }

type alias CardList = List (Face, Back)

type alias Face = String
type alias Back = String -> Bool

type Answer = Unanswered
            | Wrong
            | Correct
