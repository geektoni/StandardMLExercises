datatype 'a tipo = vuoto | elemento of 'a;
val l = [(vuoto), (elemento 5), (elemento 8), (vuoto)];

val rec check = fn vuoto => false
                | elemento e => true;

val rec test = fn a::lista => if (check a) then 1+(test lista) else (test lista)  
               | [] => 0;  
