{-# LANGUAGE FunctionalDependencies #-}

module Readlinec.Zipper
       (
        Zipper(..) 
        , ListZipper(..)
        , mvForward, mvBack, reset
        , insert, overtype, backspace, delete
       ) where

-- | A zipper is the cursor on the origin type
class Zipper m z | m -> z where
  zipper :: m a -> z a
  unzipper :: z a -> m a

newtype ListZipper a = ListZipper { getZipper :: ([a], [a]) } deriving (Eq, Show)

instance Functor ListZipper where
  fmap f (ListZipper (xs, ys)) = ListZipper (f <$> xs, f <$> ys)

instance Zipper [] ListZipper where
  zipper xs = ListZipper ([], reverse xs)
  unzipper  = fst . getZipper . reset

mvForward :: ListZipper a -> Maybe (ListZipper a)
mvForward (ListZipper ([], _))      = Nothing
mvForward (ListZipper (x:xs, back)) = Just $ ListZipper (xs, x:back)

mvBack :: ListZipper a -> Maybe (ListZipper a)
mvBack (ListZipper (_, []))     = Nothing 
mvBack (ListZipper (cur, x:xs)) = Just $ ListZipper (x:cur, xs)

reset :: ListZipper a -> ListZipper a
reset lz = maybe lz reset (mvBack lz)

insert :: a -> ListZipper a -> ListZipper a
insert x (ListZipper (cur, back)) = ListZipper (cur, x:back)

overtype :: a -> ListZipper a -> ListZipper a
overtype x (ListZipper ([], back))   = ListZipper ([], x:back)
overtype x (ListZipper (y:ys, back)) = ListZipper (ys, x:back)

backspace :: ListZipper a -> Maybe (ListZipper a)
backspace (ListZipper (_, []))     = Nothing 
backspace (ListZipper (cur, x:xs)) = Just $ ListZipper (cur, xs)

delete :: ListZipper a -> Maybe (ListZipper a)
delete (ListZipper ([], _)) = Nothing 
delete (ListZipper (x:xs, back)) = Just $ ListZipper (xs, back)
