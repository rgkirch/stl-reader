import qualified ReadPointsSpec
import qualified LinearSpec
import qualified RosettaSpec


main :: IO ()
main = do
  ReadPointsSpec.main
  LinearSpec.main
  RosettaSpec.main
