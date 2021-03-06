type atom =
    Symbol of string
  | Int of int
  | Bool of bool
  | Double of float
  | Char of char
  | String of string
  | Nil

type sexpr =
    Atom of atom
  | SQuote of sexpr
  | Unquote of sexpr
  | List of sexpr list
  | Vector of sexpr list
  | Defn of string * string list * sexpr list
  | Defmacro of string * string list * sexpr list
  | Def of string * sexpr
  | Call of string * sexpr list
  | AnonCall of sexpr list

type prog =
    Prog of sexpr list

type proto =
    Prototype of string * string array

type func =
    Function of proto * sexpr list

type macro =
    Macro of string array * sexpr list

type parsedtlform =
    ParsedFunction of Llvm.llvalue * bool
  | ParsedMacro
