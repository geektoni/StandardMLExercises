datatype naturali = successivo of naturali | zero;

val rec somma = fn  (successivo n, zero) => successivo n
                |   (zero, successivo n) => successivo n
                |   (zero, n) => n
                |   (successivo n, successivo m) => (somma (n, m));
