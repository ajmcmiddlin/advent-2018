import Control.Monad.State
import Data.Set

-- | Given a list of inputs separated on newlines, where each input is an integer prefixed with
-- either a '+' or '-' denoting its sign, sum the inputs.
part1 ::
  IO ()
part1 = do
  let
    dePlus ('+':ns) = ns
    dePlus x = x
  rawNs <- readFile input
  let ns = read . dePlus <$> lines rawNs
  print (sum ns :: Integer)

-- | Assume the input list repeats infinitely. Keep the running sum until the same sum value is
-- encountered a second time. Return that value.
part2 ::
  IO ()
part2 =
  -- Use filterM with State (Set Integer)

input :: FilePath
input = "/home/andrew/git/advent-2018/day1-input"