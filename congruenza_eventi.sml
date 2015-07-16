datatype evento = entrata of string*int | uscita of string*int

val env = [ (entrata ("pippo", 8)),
            (entrata ("rosa", 9)),
            (entrata ("giulia", 10)),
            (uscita ("giulia", 11)),
            (uscita ("pippo", 7)),
            (uscita ("rosa", 18))]

val rec search = fn (entrata (n,m)) => fn (uscita(b,c))::lista => if n=b then c else (search (entrata(n,m)) lista)
                                        | (entrata(b,c))::lista => (search (entrata(n,m)) lista)
                                        | [] => ~1; 
val rec check = fn (entrata(n,m))::lista => if (search (entrata(n,m)) lista) > m then (check lista) else false 
                |  (uscita(n,m))::lista => (check lista)
                |  [] => true;

  
