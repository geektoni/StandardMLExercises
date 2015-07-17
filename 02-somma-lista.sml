(* Function that sums every element of an int list. Tail recursive *)

local
  val rec somma_lista = fn [] => (fn sum => sum+0)
                        | a::lista => (fn sum => (somma_lista lista (a+sum)));
in
  val rec somma = fn lista => (somma_lista lista 0);
end; 
