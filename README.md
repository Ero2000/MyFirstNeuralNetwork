# MyFirstNeuralNetwork

After doing some research on neural networks, I've come to the realization that this may not exactly fit the definition of what a neural network is (although to be fair, neural networks are kind of hard to define in the first place), but yeah, I can at least say with confidence that I've created a genetic algorithm! Cheers for generational learning!

# Summary

So how this works is one can create a simple custom maze with a goal and obstacles, both of which are depicted as rectangles and/or squares. A group of entities uses a set of random commands, moving forward, left, or right, and trying to get to the goal as close as possible (or even touch it). When all the entities crash into a wall/obstacle, or the timer runs out, they are graded based on how long they lived, and how close they were to the goal. Once done, the highest graded entity will be named alpha, and gets to live on for the next generation, breeding and creating a new set of entities based off of it, with varying amount of mutations. As the grading gets better, and the entities start getting closer to the goal, the mutations occur less and less, albeit not impossible to mutate even after reaching the goal.

Though this project may need some more polish, this was a fun little experiment to try out. Hopefully I can create more interesting things in the future.
