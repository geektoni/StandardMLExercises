val t = [1,2,3,4,5,6,7,8,9,10];

local
 val rec first = fn [] => 0
                | e::l1 => e;
in
  val rec somma = fn [] => []
                | e::l1 => if (first l1) != 0 then  e + (somma l1) else 0; 
end;
