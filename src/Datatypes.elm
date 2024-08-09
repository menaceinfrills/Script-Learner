module Datatypes exposing (..)

import Array exposing (..)

type Msg = Focus Int

type alias Model = { selected : Maybe Int
                   , cards    : List Card
                   }

type alias Card = { id       : Int
                  , face     : Face
                  , back     : Back
                  , answered : Answer
                  }

type alias CardList = List (List (Face, Back))

type alias Face = String
type alias Back = String -> Bool

type Answer = Unanswered
            | Wrong
            | Correct
