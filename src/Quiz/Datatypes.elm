module Quiz.Datatypes exposing (..)

type Msg = Focus Card
         | Answer String
         | Select CardHead
         | ToNextScreen
         | ToQuizScreen CardList

type alias CardHead = { name : String
                      , check : Bool
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
