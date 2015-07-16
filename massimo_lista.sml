val rec massimo = fn [] => []
            | [a] => [a]
            | a::b::l => if a>b then (massimo ([a]@l)) else (massimo ([b]@l));

val rec massimo2 = fn [] => []
                   | [a] => [a]
                   | a::l => if a>(hd l) then (massimo (a::l)) else (massimo l);
