use "ordina_eventi.sml";

val env = [ (entra ("pippo", 8)),
            (entra ("rosa", 9)),
            (entra ("giulia", 10)),
            (esce ("pippo", 9)),
            (esce ("giulia", 15)),
            (esce ("rosa", 10))]

val rec search = fn (entra (n,m)) => fn (esce(b,c))::lista => if n=b then c else (search (entra(n,m)) lista)
                                        | (entra(b,c))::lista => if n=b then ~1 else (search (entra(n,m)) lista)
                                        | [] => ~1; 
val rec consistenza = fn lista => let
val rec check = fn (entra(n,m))::lista => if (search (entra(n,m)) lista) > m then (check lista) else false 
                |  (esce(n,m))::lista => (check lista)
                |  [] => true;
  in
    check (controlla env)
  end;

  
