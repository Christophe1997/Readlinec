module Readlinec.ListZipper
       (
        
       ) where

newtype ListZipper a = ListZipper { getZipper :: ([a], [a]) }

instance Functor ListZipper where
  fmap f (ListZipper (xs, ys)) = ListZipper (f <$> xs, f <$> ys)


zipper :: [a] -> ListZipper a
zipper xs = ListZipper (xs, [])

mvForward :: ListZipper a -> Maybe (ListZipper a)
mvForward (ListZipper ([], _)) = Nothing
mvForward (ListZipper (x:xs, back)) = Just $ ListZipper (xs, x:back)

mvBack :: ListZipper a -> Maybe (ListZipper a)
mvBack (ListZipper (_, [])) = Nothing 
mvBack (ListZipper (cur, x:xs)) = Just $ ListZipper (x:cur, xs)

reset :: ListZipper a -> ListZipper a
reset lz = maybe lz reset (mvBack lz)

unzipper :: ListZipper a -> [a]
unzipper = fst . getZipper . reset