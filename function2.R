f <- function(x) {
 y <- 2
 print(y^2 + g(x))
}

g <- function(x) {
 x*y
 }

y <- 10

f(3)