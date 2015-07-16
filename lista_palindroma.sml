val lista = [1,2,3,2,1];
val lista2 = [1,2,3,2,4];

(*  
    Ambiente locale in cui inizializzo una funzione per 'invertire'
    gli elementi di una lista. Così evito che si veda anche all'esterno.
*)
local
  fun reverse [] = [] 
      |reverse (a::lista) = reverse(lista) @ [a];
in
  (*
    Questa funzione pal è in realtà composta a una funzione palindroma
    che controlla due liste, per vedere se sono identiche. Solo che una delle
    due liste sarà l'inversa dell'altra. 
  *)
  val rec pal = fn lista =>
    let
      val rec palindroma = fn (a::lista, b::lista2) => if a=b then palindroma (lista, lista2) else false
                               | (a::lista, []) => false
                               | ([], b::lista) => false
                               | ([], []) => true;
    in
      palindroma(lista, reverse(lista))
    end;
end;
