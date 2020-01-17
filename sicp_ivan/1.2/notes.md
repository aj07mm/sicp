# 1.2 Procedures and the Processes They Generate

Important thing here is to note separation between two concepts.

1. Procedure which defines the process or the way process is defined.
2. The nature of the process itself.

For example, it can be seen that procedure might represent recursive
definition of the process, but process itself doesn't have to be
recursive. It might be iterative in its nature.

Two types of processes that we can differentiate are

* Iterative
* Recursive

If orders of growth are defined in linear polynomial notation like O(n)
we say call processes linear.

Some language implementation can be `smart` and figure out that process
is iterative and even if it is defined by recursive procedure optimize
and execute as linear iterative process. This is called [tail recursion](http://c2.com/cgi/wiki?TailRecursion)
Usually process can be executed as iterative if is defined recursively
but after finishing the recursion it doesn't do anything but just
returning the value.

## Linear recursive

time = O(n)
space = O(n)

This kind of process has pars of the state in variables that are out of
local scope of execution and are in fact part of the process.

## Linear iterative

time = O(n)
space = O(c) - constant

This kind of process has all the states that define it captured in local
variables and could be restarted with provided local variables in any
time.

## Tree recursion

Common pattern of recursive computation. It is usually characterized by
lot of redundant computations. If, for example, we take default
recursive approach of computing Fibonacci sequence and construct the
tree of the recursion we can immediately see how sub-optimal that
computation is. Despite that, it is very easy to reason about this kind
of process and therefore it is used for exploring and explanations all
the way around.

## Orders of growth

If we define size of input parameter as size of the problem (i.e. n-th
number of Fibonacci sequence, or angle of sine function). Then we can
calculate how much resources in time and space will our algorithm take
for that size.

If we set size to very big, we can see how time and space will evolve
while we increase the size of the problem. In fact how resource
consumption will grow.

There are different common patterns of growth. Some of them are:

* O(1) - constant. Like accessing indexed string

* O(n) - linearly growing resource consumption with size of the problem
growth. For size 1000 we need 1000 steps :(

* O(log[n]) - logarithmic growth, which is much better than linear for
big values of problem size. For size 1000 we need 16 steps :)

* O(n*log[n]) - linear logarithmic. Still great performance.

* O(n^2) - quadratic, resource consumption grows proportional to the power of 2 of the size
of the problem

* O(k^n) - exponential, resource consumption grows exponentially. You
don't want this for any bigger number.

* O(n!) - factorial one, yaiks!

For graphing these functions, so it can be visually compared use:
http://rechneronline.de/function-graphs/

[see more](http://introcs.cs.princeton.edu/java/41analysis/)

## Remarks on going logarithmic

Several examples, related to orders of growth, show how to improve the
behavior of the algorithm just by understanding that breaking the
problem on half in every iteration will lead to logarithmic behavior.
