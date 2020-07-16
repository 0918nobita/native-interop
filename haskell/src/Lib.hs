module Lib
    ( someFunc
    ) where

foreign import ccall my_func :: IO Int

someFunc :: IO ()
someFunc = my_func >>= (putStrLn . show)
