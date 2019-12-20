-- The Collatz sequence takes in a number, and either
-- divides by 2 if it is even, or
-- multiplies it by 3 and adds 1 if it is odd.
-- The famous Collatz conjecture asks whether the sequence,
-- from any positive initial value, will reach 1.


--
-- a guard expression is used for the 'collatz' variable,
-- used for finding the next number in a sequence. This is
-- neater than if / else if.
collatz n
    | n `mod` 2 == 0 = n `div` 2 -- if n is even, return n / 2
    | otherwise = 3 * n + 1 -- else return 3n + 1

-- 
-- another guard expression, this time for the variable that
-- generates whole sequences. it is recursive, and takes 
-- advantage of the 'collatz' variable too.
cltzList n
    | n <= 0 = error "The number must be positive."
    | n == 1 = [n] -- if n is 1 return n:[]
    | otherwise = n:cltzList (collatz n) -- else, recursive-call


-- 4

Many of the comments repeat what the code next to them does. This might be helpful for a Haskell beginner, but it's pointless to a reader who knows the language. Try to remove these comments as soon as you understand the Haskell constructs you're using.

The name cltzList is too abbreviated. Vowels are not expensive! collatzList is clearer. collatzSeq is better, since it's commonly called the “Collatz sequence”.

It's not necessary to give an error for negative n — the Collatz function is well-defined (and interesting, because there are several loops) for negative n.

It would be clearer to write collatzSeq in terms of iterate and takeWhile (or a variant that keeps the terminating element) instead of explicit recursion, but this isn't necessary for a beginner.


