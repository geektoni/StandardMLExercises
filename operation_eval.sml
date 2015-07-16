datatype espressione = costante    of int
                     | somma       of espressione * espressione
                     | sottrazione of espressione * espressione
                     | prodotto    of espressione * espressione
                     | divisione   of espressione * espressione;

val rec eval = fn costante x => x
           |  somma (x,y) => eval(x)+eval(y)
           |  sottrazione (x,y) => eval(x)-eval(y)
           |  prodotto (x,y) => eval(x)*eval(y)
           |  divisione (x,y) =>  eval(x) div eval(y);
           (*|  _ => 0;*)
