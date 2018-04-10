import System.Environment
import Data.List
import Data.Char

-- this works to see if foo is an element of the permutations of "oof":
-- lowerCase "foo" `elem` permutations "oof"

-- so more generally we want this:
-- lowerCase INPUTWORD `elem` permutations ALL_WORDS_IN_LIST

-- n.b. no duplicates should be returned! e.g. meet and meet should be treated as the same word.

main = do
   args <- getArgs
   content <- readFile (args !! 0)
   fileWords <- lines content
   map lowerCase fileWords
   -- let bar = map lowerCase fileWords
   -- return bar

-- takes a string and returns a lowercase versoin of it
-- lowercase "FOO" -> "foo"
lowerCase :: String -> String
lowerCase [] = []
lowerCase (start:end) = [toLower start] ++ lowerCase end
--
shorterThan :: String -> Int -> IO [String]
shorterThan fileName len = do fileContents <- readFile fileName
                              let fileWords = lines fileContents
                              let shorterThanWords = [word | word <- fileWords, (length word) < len]
                              return shorterThanWords
