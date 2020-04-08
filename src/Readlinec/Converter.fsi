namespace Readlinec

type Converter =
  { convert: Context -> Context }
  
module Converter =
  val empty: Converter
  val seq: Converter list -> Converter
  val ifElse:  ('a -> bool) -> Converter -> Converter -> 'a -> Converter
  val dict: Map<'a, Converter> -> 'a -> Converter