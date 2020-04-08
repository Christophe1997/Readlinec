namespace Readlinec

type Buffer =
  | RawInput of char list
  | AlterInput of string * Buffer
  
module Buffer =
  val empty: Buffer
