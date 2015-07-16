val t = [10,9,8,4,3,2,1];

              local
                val cmp = fn [] => (fn n => true)
                          | m::l1 => (fn n => if n > m then true else false);
              in   
                val rec check = fn [] => true 
                                | e::l1 => if (cmp l1 e) then check l1 else false;
              end;
