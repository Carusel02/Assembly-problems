# Assembly

## Implementation

### task1 
- the idea of `task1` is to extract each letter in an `8-bit register` and effectively encode it by collecting the step data value in the `register`
### task2
- the idea in `task2` part 1 is to find the line on which the points are located, (check if the x or y coordinates are equal) and decreasing the remaining coordinates
- the idea in `task2` part 2 is to call the function from part 1 and add it to a vector of distances,then increasing its address
- the idea in `task2` part 3 is to take an index and find out its square using either `loop` or `jump` , then the comparison with the element in the distance vector
### task3
- the idea of `task3` is similar to that of `task1` , both letters are taken from plain and key and using an algorithm resulting from the `tabular matrix`,
add the resulting letter in `enc_string`. 

The algorithm can be presented as follows:
- if the letter in `plain < key`, it is subtracted in the `ascii code` key - plain and 65 is added
- if the letter in `plain > `key, their difference is subtracted from 26 and 65 is added.
- also, an area is needed to `refresh` and forget the address of the key in case the string is longer than this
### task4
- the idea of `task4` is to generate the indexes corresponding to the `spiral matrix` by using jumps in `4 areas` where the spiral matrix is traversed
(`top side` area, then `right side`, then `bottom side`, `left side` and then `repeat`).
- a `zone` must also be implemented that decreases the number of steps taken to traverse the zones, because the more the spiral progresses, the more it decreases in ***"dimension"***.
- then it is taken from the address where the `key matrix` is with the generated index and adding it to the `letter plain`, everything is put at the address where the string must be encoded.
