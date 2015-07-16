datatype naturale = zero | successivo of naturale;

val t = successivo (successivo(zero));
val n = successivo (successivo (zero));

val rec somma = fn zero => (fn n => n)
                | successivo a => (fn n => successivo (somma a n));

val rec prodotto = fn zero => (fn n => zero)
                 | successivo b => (fn n => if b=zero then n else (prodotto b (somma n  n)));
