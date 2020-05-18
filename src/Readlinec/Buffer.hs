module Readlinec.Buffer
       (
         Buffer
       ) where

data Buffer = RawInput String
            | AlterInput String Buffer
              deriving Eq

instance Show Buffer where
  show (RawInput s) = s
  show (AlterInput s b) = s ++ show b