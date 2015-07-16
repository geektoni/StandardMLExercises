val t = [1,2,3,4,5,6,7,8,9,10];

local
  (* Function that return list first element *)
  val rec first = fn [] => 0
                  | e::l1 => e;
in
  (* Final somma function. If nil is passed, the function never ends *)
  val rec somma = fn [] => (somma [])
                | e::l1 => if (first l1) = 0 then 0 else e+(somma l1); 
end;
