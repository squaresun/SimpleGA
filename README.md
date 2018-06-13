# Simple Genetic Algorithm

An implementation of Genetic Algorithm using Matlab. See [example](https://github.com/squaresun/BezierCurveShortestPath).

> :warning: Only support for sample space with [0, 1) since only fractional bits are encoded during crossover and mutation.

## Implementation

### Selection ([wrw.m](https://github.com/squaresun/SimpleGA/blob/master/wrw.m))

I use [fitness proportionate selection](https://en.wikipedia.org/wiki/Fitness_proportionate_selection) (roulette wheel selection) in the selection phase.

> :pencil: You can switch the probability ordering, in order to find the [maxima and minima](https://en.wikipedia.org/wiki/Maxima_and_minima).
> |Extrema|Ordering||
> |-|-|-|
> |Maxima|Ascending||
> |Minima|Descending|default|

---

### Crossover ([reproduction.m](https://github.com/squaresun/SimpleGA/blob/master/reproduction.m))

Crossovers the whole population. Each pair crossover with respect to their dimensions.

Example, crossover `a` and `b`:

**before**:
|chromosome|t1|t2|t3|
|---|---|---|---|
|a|101111**01**|10**101011**|0100**1101**|
|b|101100**00**|11**000110**|0101**0001**|

**after**:
|chromosome|t1|t2|t3|
|---|---|---|---|
|a|10111100|10000110|01000001|
|b|10110001|11101011|01011101|

> :pencil: You can modify the encoding precision, n
> Default: 10

---

### Mutation ([mutation.m](https://github.com/squaresun/SimpleGA/blob/master/mutation.m))

The probability of mutation is set to be :pencil: `0.001` and only a random digit in one of dimension would be mutated.

> :pencil: You can modify the encoding precision, n
> Default: 10

---

### Stopping Criteria
Fixed iteration time.

---

## Utilities

### [fitness.m](https://github.com/squaresun/SimpleGA/blob/master/fitness.m)

Return the fitness of each individual.

#### Input: 
1. fitness function
2. Individuals

#### Output:

All individuals' fitness, in array.

```
fitS =

    5.5910    5.5910    5.5910    5.5910    5.7358    5.5910    5.7358    5.7358    5.7358    5.5910
```

---

### [mostFit.m](https://github.com/squaresun/SimpleGA/blob/master/mostFit.m)

Return the fittest individual in population.

#### Output example:
```
result =

    0.2317    0.5386    0.7918    0.9707    0.7742    0.3656    0.4340
```