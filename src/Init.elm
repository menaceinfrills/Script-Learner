module Init exposing (initCards, cardList)

import Card exposing (..)
import Datatypes exposing (..)

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
barakhadi = [ ("अ", (\x -> x == "a"))
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
