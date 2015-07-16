
(* Testing purpose *)
datatype 'a tipo = vuoto | elemento of 'a;
val l = [(vuoto), (elemento 5), (elemento 8), (vuoto)];
val rec custom_check = fn vuoto => false
                | elemento e => true;

(* Count function *)
val rec count = fn (a::lista, check) => if check(a) then 1+(count (lista, check)) else (count (lista, check))
               | ([], check) => 0; 
