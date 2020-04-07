module internal Readlinec.CSI

let header = "\u001b["


  
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

let inline csi1 c (n:int) = sprintf "%s%d%s" header n c
let CUU = csi1 "A"
let CUD = csi1 "B"
let CUF = csi1 "C"
let CUB = csi1 "D"
let CNL = csi1 "E"
let CPL = csi1 "F"
let CHA = csi1 "G"
let inline CUP (n:int) (m:int) = sprintf "%s%d;%dH" header n m
let ED = csi1 "J"
let EL = csi1 "K"
let SU = csi1 "S"
let SD = csi1 "T"
let SGR = csi1 "m"


