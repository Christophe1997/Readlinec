/// Control Sequence Introducer,
/// for more details, see https://en.wikipedia.org/wiki/ANSI_escape_code#CSI_sequences
module internal Readlinec.CSI

val header: string


type TextAttr =
  | Normal = 0
  | Bold = 1
  | Faint = 2
  | Underscore = 4
  | Blink = 5
  | ReverseVideo = 7
  
type Ground =
  | ForeGround = 30
  | BackGround = 40
  
/// Cursor Up
val CUU: (int -> string)
/// Cursor Down
val CUD: (int -> string)
/// Cursor Forward
val CUF: (int -> string)
/// Cursor Back
val CUB: (int -> string)
/// Cursor Next Line
val CNL: (int -> string)
/// Cursor Previous Line
val CPL: (int -> string)
/// Cursor Horizontal Absolute
val CHA: (int -> string)
/// Cursor Position
val inline CUP: int -> int -> string
/// Erase in Display
val ED: (int -> string)
/// Erase in Line
val EL: (int -> string)
/// Scroll Up
val SU: (int -> string)
/// Scroll Down
val SD: (int -> string)
/// Select Graphic Rendition
val SGR: (int -> string)

