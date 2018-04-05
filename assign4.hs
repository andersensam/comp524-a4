import System.Environment

main = do
    [dictFile, word] <- getArgs
    dict <- readFile dictFile
    -- idk