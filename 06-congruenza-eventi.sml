datatype evento = entra of string*int | esci of string*int

val env = [ (entra ("pippo", 13)),
            (entra ("rosa", 9)),
            (entra ("giulia", 10)),
            (esci ("giulia", 11)),
            (esci ("pippo", 14)),
            (esci ("rosa", 18))]

local
  (* Search function, returns the exit hour or ~1 if there are duplicates or time-travel issues *)
  val rec search = fn (entra (n,m)) => (fn (esci(b,c))::lista => if n=b then c else (search (entra(n,m)) lista)
                                        | (entra(b,c))::lista => if n=b then ~1 else (search (entra(n,m)) lista)
                                        | [] => ~1)
                   | (esci (n,m)) => (fn lista => ~1); 
in
  (* Check function *)
  val rec check = fn (entra(n,m))::lista => if (search (entra(n,m)) lista) > m then (check lista) else false 
                |  (esci(n,m))::lista => (check lista)
                |  [] => true;
end;
