port module Ports exposing (messageReceiver)


port messageReceiver : (String -> msg) -> Sub msg
