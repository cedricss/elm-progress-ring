module Progress.Ring exposing (circumference, normalizedRadius, view)

{-| Progress Ring with elm/svg

@docs circumference, normalizedRadius, view

-}

import Html exposing (Html)
import Svg exposing (circle, svg)
import Svg.Attributes exposing (cx, cy, fill, height, r, stroke, strokeDasharray, strokeDashoffset, strokeWidth, style, width)


{-|

    The progress value should be between 0 and 1

-}
type alias Config =
    { color : String
    , progress : Float
    , radius : Float
    , stroke : Float
    }


{-|

    Return the circumference of the ring at 100% progress

-}
circumference : Config -> Float
circumference config =
    normalizedRadius config * 2 * pi


{-|

    Return the radius of the ring, minus the ring stroke

-}
normalizedRadius : Config -> Float
normalizedRadius config =
    config.radius - config.stroke / 2


{-|

    Return an SVG of the ring.

-}
view : Config -> Html msg
view config =
    let
        circumferenceAttribute =
            String.fromFloat (circumference config)

        normalizedRadiusAttribute =
            String.fromFloat (normalizedRadius config)

        offsetAttribute =
            String.fromFloat ((1 - config.progress) * circumference config)

        radiusAttribute =
            String.fromFloat config.radius

        sizeAttribute =
            String.fromFloat (config.radius * 2)

        strokeAttribute =
            String.fromFloat config.stroke
    in
    svg
        [ height sizeAttribute
        , width sizeAttribute
        ]
        [ circle
            [ fill "transparent"
            , stroke config.color
            , strokeDasharray
                (String.concat
                    [ circumferenceAttribute
                    , " "
                    , circumferenceAttribute
                    ]
                )
            , strokeDashoffset offsetAttribute
            , strokeWidth strokeAttribute
            , r normalizedRadiusAttribute
            , cx radiusAttribute
            , cy radiusAttribute
            , style "transform: rotate(-90deg); transform-origin: 50% 50%;"
            ]
            []
        ]
