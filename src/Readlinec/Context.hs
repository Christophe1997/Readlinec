module Readlinec.Context
       (
         Context
       ) where

data Context h b = Context {
  getRow :: Int,
  getCol :: Int,
  getHistory :: h,
  getBuffer :: b
}
