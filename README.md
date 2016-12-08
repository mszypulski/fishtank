# The Fish Tank Simulation

###The simulator has the following properties:

1. There is only one fish tank;

2. The user can add fish, snails and fish food;

3. Living fish and snails both eat fish food;

4. Piranha fish may also eat other fish;

5. Clockwork fish do not eat anything;

6. The user can vary the temperature of the fish tank;

7. When the temperature falls below 15 degrees centigrade, piranha fish die;

8. Events in the fish tank are time based; every interval:

* The user may change the state of the fish tank (adding items, changing the temperature etc.);

* Inhabitants that eat food, do so;

* Inhabitants may be eaten or otherwise die;

---
##Task 1: The Goldfish Bowl

Create a very simple simulation that represents a fish tank with a single generic fish in it.
On each cycle of the simulation's loop, the fish should move around the tank, and you should draw the state of the tank somehow so that we can see what is happening (can be as simple as coloured dots).

---
##Task 2: Population Diversity

Separate your generic fish into three distinct types of fish: A goldfish, a piranha, and a clockwork fish and add several of each to your tank. Also create and add a snail to the tank, remembering to update your output so that we can see them.

---
##Task 3: A Fragile Balance

Add a random amount of food to your tank at the start of the simulation for the goldfish and snails to eat. If the fish and snails run out of food they will die and be removed from the simulation. Piranha also need to eat but less often, and from time to time will take a goldfish. If there are no goldfish left the piranha will eat each other until there is only one left who eventually dies too. The only immortal creatures are the clockwork fish.

---
##Task 4: Divine Influence

The fish tank has an owner, our user. The user can influence the fish tank by either adding more food (hit the **space key**) or changing the temperature of the tank (**left and right arrow keys**) and adding more fishes, piranhas, snails by clicking **proper icon** at the top on the screen. If the temperature falls below 15 degrees centigrade then it is too cold for the piranha and they begin to perish.

