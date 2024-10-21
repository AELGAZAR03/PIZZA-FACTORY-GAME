# Product-Assembly-Game
My code resulted in the following Gameplay Mechanics: Players must add toppings to the pizzas before they reach
the end of the conveyor belt. The game begins with two basic toppings: Pizza Sauce and Mushroom, and as the
player progresses, more toppings become available, including pepper, onion, and Prawn. Each topping is represented
by a separate class that handles its display, positioning, and interaction with the pizza. The pizzas themselves are
objects capable of holding different toppings. Players use the mouse to drag toppings on the pizzas. This happens by
detecting if the mouse moves over a topping and whether it is already attached to a pizza. When players select a
topping, it moves with the mouse until player release it. If a topping is properly placed on a pizza, it becomes
connected to it and change shape to fit the pizza shape. If a pizza exit the screen with no toppings, the game ends.
