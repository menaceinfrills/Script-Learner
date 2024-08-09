module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Datatypes as D

view : D.Card -> Html D.Msg
view card = let idn   = card.id
                idstr = String.fromInt idn
            in div [] [ h1 [] [ text card.face ]
                      , input [ id idstr, onFocus (D.Focus idn)
                      ] [] ]
