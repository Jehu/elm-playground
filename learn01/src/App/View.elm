module App.View exposing (..)

import App.Types exposing (..)
import Html exposing (..)
import Login.View as Login
import SignUp.View as SignUp
import Routing.Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.currentRoute of
        LoginRoute ->
            Html.map LoginMsg (Login.view model.loginModel)

        SignupRoute ->
            Html.map SignUpMsg (SignUp.view model.signUpModel)
