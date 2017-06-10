module Routing.Types exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = LoginRoute
    | SignupRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LoginRoute (s "login")
        , map SignupRoute (s "signup")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            LoginRoute
