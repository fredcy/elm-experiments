import Html exposing (..)
import Signal.Extra
import Window

{- Show how `Signal.foldp` loses the initial value of the input signal (by design).
 -}

main : Signal Html
main =
    Signal.map3 view3 raw folded folded'

type alias Model = (Int, Int)

raw : Signal Model
raw =
    Window.dimensions
          
folded : Signal (List Model)
folded =
    Signal.foldp (::) [] Window.dimensions
    
folded' : Signal (List Model)
folded' =
    Signal.Extra.foldp' (::) (\x -> [x]) Window.dimensions

view3 : a -> b -> c -> Html
view3 x y z =
    ul []
           [ li [] [ x |> toString |> text ]
           , li [] [ y |> toString |> text ]
           , li [] [ z |> toString |> text ]
           ]
 
 
    
