val lista = [("a", 1), ("b", 2)];

datatype espressione = costante    of int
                     | variabile   of string
                     | somma       of espressione * espressione
                     | sottrazione of espressione * espressione
                     | prodotto    of espressione * espressione
                     | divisione   of espressione * espressione
                     | var         of string      * espressione * espressione;

val rec eval = fn costante    n        => n
                | somma       (a1, a2) => (eval a1) + (eval a2)
                | sottrazione (a1, a2) => (eval a1) - (eval a2)
                | prodotto    (a1, a2) => (eval a1) * (eval a2)
                | divisione   (a1, a2) => (eval a1) div (eval a2);



local
  val rec search = fn (n:string, (a:string,b)::l) => if n=a then b else search(n, l)
                   |  (n:string, []) => 0;  
in 
  val rec eval_2 = fn l =>          fn costante n  => n 
                                    |  variabile n => search(n, l)
                                    |  somma (p,q) => (eval_2 l p) + (eval_2 l q)
                                    |  sottrazione (p,q) => (eval_2 l p) - (eval_2 l q)
                                    |  prodotto (p,q) => (eval_2 l p) * (eval_2 l q)
                                    |  divisione (p,q) => (eval_2 l p) div (eval_2 l q)
                                    |  var (x:string, p,q) => eval_2 ((x, (eval_2 l p))::l) q;                                      
end;
