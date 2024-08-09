module Init exposing (initCards, cardList)

import Datatypes exposing (..)
import Array exposing (..)

initCards : CardList -> List Card
initCards cards = let subcards = cards !! 0
                  in List.map (initCard <|List.length subcards) subcards

initCard : Int -> (Face, Back) -> Card
initCard id (face, back) = { id       = id
                           , face     = face
                           , back     = back
                           , answered = Unanswered
                           }

cardList : CardList
cardList = barakhadi

barakhadi : CardList
barakhadi =
            [ [ ("अ", (\x -> x == "a"))
              , ("आ", (\x -> x == "aa"))
              , ("इ", (\x -> x == "i"))
              , ("ई", (\x -> x == "ii"))
              , ("उ", (\x -> x == "u"))
              , ("ऊ", (\x -> x == "uu"))
              , ("ए", (\x -> x == "e"))
              , ("ऐ", (\x -> x == "ai"))
              , ("ओ", (\x -> x == "o"))
              , ("औ", (\x -> x == "au"))
              , ("अं", (\x -> x == "aM"))
              , ("अः", (\x -> x == "aH"))
              ]
            ]
