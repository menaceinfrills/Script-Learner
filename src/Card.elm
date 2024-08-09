module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Datatypes as D

view : Int -> Html D.Msg
view idn = let idstr = String.fromInt idn
                in div [] [ input [ id idstr, onFocus (D.Focus idn) ] [] ]
