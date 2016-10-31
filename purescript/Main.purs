module Main (setup) where
import Prelude
import Scripts (scripts, Script')
import Data.Foldable (traverse_)
import Control.Monad.Eff.Exception (message, catchException)
import Control.Monad.Eff.Console (error)

setup :: Script'
setup r = traverse_ ((flip ($) r) >>> catchException (error <<< message)) scripts
