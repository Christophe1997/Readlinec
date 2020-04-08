namespace Readlinec

type Context =
  { row: int
    col: int
    history: History
    buffer: Buffer }

module Context =
  val empty: Context
