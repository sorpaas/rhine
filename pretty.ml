open Ast

let print_bool = function true -> print_string "true"
                        | false -> print_string "false"

(* pretty print atoms *)
let ppatom p = match p with
    Symbol(s) -> print_string ("sym:" ^ s)
  | String(s) -> print_string ("str:" ^ s)
  | Int(i) -> print_string "int:"; print_int i
  | Bool(i) -> print_string "bool:"; print_bool i
  | Double(d) -> print_string "dbl:"; print_float d
  | Nil -> print_string "nil"

(* pretty print S-expressions *)
let rec ppsexpr p = match p with
    Atom(a) -> ppatom a
  | List(sel) -> print_string "( ";
                 List.iter (fun i -> match i with
                                       Atom(a) -> ppatom a;
                                                  print_char ' '
                                     | _ -> ppsexpr i) sel;
                 print_string " )"
  | Vector(qs) -> print_string "[ ";
                    Array.iter (fun i -> ppsexpr i;
                                         print_char ' ') qs;
                    print_char ']'
(* pretty print the program *)
let pprint p = match p with
    Prog(ss) -> List.iter (fun i -> ppsexpr i;
                                    print_newline ();
                                    print_newline ()) ss
