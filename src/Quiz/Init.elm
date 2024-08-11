module Quiz.Init exposing (initCards, cardList)

import Quiz.Card exposing (..)
import Quiz.Datatypes exposing (..)

initCards : CardList -> List Card
initCards cards = List.map2 initCard (List.range 1 <| List.length cards) cards

initCard : Int -> (Face, Back) -> Card
initCard id (face, back) = { id       = id
                           , face     = face
                           , back     = back
                           , answered = Unanswered
                           }

cardList : CardList
cardList = barakhadi

barakhadi : CardList
barakhadi = [ ("अ", ["a"])
            , ("आ", ["aa"])
            , ("इ", ["i"])
            , ("ई", ["ii"])
              , ("उ", ["u"])
              , ("ऊ", ["uu"])
              , ("ए", ["e"])
              , ("ऐ", ["ai"])
              , ("ओ", ["o"])
              , ("औ", ["au"])
              , ("अं", ["aM"])
              , ("अः", ["aH"])
              ]
