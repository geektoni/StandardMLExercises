val lista = [1,2,3,4,5,6,7];
val lista2= [0,3,4,6,9,1];

local
  (* Local functions that checks if m is greater than n *)
  val cmp = fn [] => (fn n => true)
            | m::l1 => (fn n => if m > n then true else false);
in
  (* Function that checks if the given list is ordered *)   
  val rec check = fn [] => true 
                  | e::l1 => if (cmp l1 e) then check l1 else false;
end;
