namespace Readlinec

type 'a Converter =
  { convert: Context * 'a -> Context }
  
module Converter =
  val empty: 'a Converter
  