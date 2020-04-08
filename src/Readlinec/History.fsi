namespace Readlinec

/// A History is the type that holds user input history
type History =
  { prev: string list
    next: string list }

exception NoPrevHistory

module History =
  /// Empty history value
  val empty: History
  /// Add entry to history
  val addHistory: history:History -> entry:string -> History
  val addHistories: history:History -> entries:string list -> History
  /// Change History status, which means change the history
  /// from this input to last input
  val previous: k:int -> history:History -> History
  val previous1: (History -> History)
  val next: k:int -> history:History -> History
  val next1: (History -> History)

  /// Head always return the last entry in the history
  val head: history:History -> string
  /// Tail return the history without last entry
  val tail: history:History -> History
