module Datatypes exposing (..)

type Msg = Focus Int

type alias Model = { selected : Maybe Int
                   , ids      : List Int
                   }

type alias Card = { id : Int
                  , face : String
                  , answered : Answer
                  }

type Answer = Unanswered
            | Wrong
            | Correct
