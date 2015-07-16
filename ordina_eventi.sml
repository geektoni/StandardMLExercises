datatype evento = entra of string * int | esce of string * int;

(* Funzione che ritorna l'orario di entrata/uscita *)
val getval = fn  esce (a,b) => b
            |entra (a,b) => b;

(* Funzione che ritorna il nome di entrata/uscita  *)
val getname = fn esce(a,b) => a
              |  entra(a,b) => a;

(* Funzione che ritorna l'ultima persona che è entrata/uscita *)
val rec massimo = fn (a::b::l) => if ((getval a) > (getval b)) then (massimo (a::l)) else (massimo (b::l)) 
                  | [a] => a;

(* Funzione che ritorna una lista senza l'elemento specificato a *)
val rec delete = fn a => fn (b::l) => if (getval a)=(getval b) then
                                        if (getname a)=(getname b) then
                                        l else [b]@(delete a l)
                                       else [b]@(delete a l)
                            | [] => [];

(* Funzione che mette in ordine crescente una lista di entrate/uscite *)
val rec controlla = fn 	 [] => []
							        |    [a] => [a]
                      |    l => (controlla (delete (massimo(l)) l)) @ [(massimo l)]; 
