import System.Environment
import Data.List
import Data.Char

-- this works to see if foo is an element of the permutations of "oof":
-- lowerCase "foo" `elem` permutations "oof"

-- so more generally we want this:
-- lowerCase INPUTWORD `elem` permutations ALL_WORDS_IN_LIST


-- foreach word in dictionary
--     if input_word in permutations(word)
--         return word

-- n.b. no duplicates should be returned! e.g. meet and meet should be treated as the same word.

assign4 :: String -> String -> IO [String]
string dict word = do
	fileContents <- readFile dict
	fileLines <- lines dict


main = do
   args <- getArgs
   content <- readFile (args !! 0)
--    fileWords <- lines content
--    map lowerCase fileWords
--    -- let bar = map lowerCase fileWords
--    -- return bar

-- Takes a string and returns a lowercase versoin of it
-- e.g. lowercase "FOO" -> "foo"
-- @param string array
lowerCase :: String -> String
lowerCase [] = []
lowerCase (start:end) = [toLower start] ++ lowerCase end


-- Dong said we need this method but I don't know why...
-- @param fileName string the path to the dictionary file
-- @param len int words should be shorter than this length
shorterThan :: String -> Int -> IO [String]
shorterThan fileName len = do
	fileContents <- readFile fileName
	let fileWords = lines fileContents
	let shorterThanWords = [word | word <- fileWords, (length word) < len]
	return shorterThanWords

-- if permutations(inputWord) = dictionaryWord, then return dictionaryWord
-- e.g. isPermutation("foo","bar") = null
-- e.g. isPermutation("foo","oof") = "oof"
-- @param inputWord string a word inputted by user
-- @param dictionaryWord string a word in the dictionary
-- @return dictionaryWord String if inputWord is a permutation of dictionaryWord. Else, null
-- TODO this doesn't work
isPermutation :: String -> String -> Maybe String
isPermutation inputWord dictionaryWord = do
	perms <- permutations inputWord
	if dictionaryWord `elem` perms
		then return Just dictionaryWord
		else return Nothing
