module Datatypes exposing (..)

type Msg = Focus Card
         | Answer String

type alias Model = { answer : String
                   , select : Maybe Card
                   , deck   : List Card
                   }

type alias Card = { id       : Int
                  , face     : Face
                  , back     : Back
                  , answered : Answer
                  }

type alias CardList = List (Face, Back)

type alias Face = String
type alias Back = List String

type Answer = Unanswered
            | Wrong
            | Correct
