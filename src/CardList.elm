module CardList exposing (cardList, cardHeaders, listFromHeaders)

import Quiz.Datatypes exposing (..)

cardHeaders : List String
cardHeaders = [ "Monophthongs (अ)"
              , "Sonorants (ऋ)"
              , "Diphthongs (ए, ऐ)"
              , "Anusvāra & visarga (अः)"
              ]

listFromHeaders : List CardHead -> CardList
listFromHeaders heads = let headRead head = if not head.check then []
                                            else case head.name of
                                                      "Monophthongs (अ)" -> monophtongs
                                                      "Sonorants (ऋ)" -> sonorants
                                                      "Diphthongs (ए, ऐ)" -> diphthongs
                                                      "Anusvāra & visarga (अः)" -> misc
                                                      _ -> []
                        in List.foldr (\x -> (++) (headRead x) ) [] heads


cardList : CardList
cardList = misc

monophtongs : CardList
monophtongs = [ ("अ", ["a"])
            , ("आ", ["aa"])
            , ("इ", ["i"])
            , ("ई", ["ii"])
              , ("उ", ["u"])
              , ("ऊ", ["uu"])
              ]

sonorants = [ ("ऋ", ["RRi"])
            , ("ॠ", ["RRI"])
            , ("ऌ", ["LLi"])
            , ("ॡ", ["LLI"])
            ]

diphthongs =   [ ("ए", ["e"])
              , ("ऐ", ["ai"])
              , ("ओ", ["o"])
              , ("औ", ["au"])
              ]

misc = [ ("अं", ["aM"])
              , ("अः", ["aH"])
              ]
