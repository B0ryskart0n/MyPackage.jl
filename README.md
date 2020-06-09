# MyPackage.jl

## Welcome to the program for simulating the movement of celestial bodies!

### Launch the main script by entering in Your terminal: 'julia MyPackage.jl'

#### At the start You might want to check the Example button, it will do everything for You. Just give it a second.

#### To start using the program we suggest taking a piece of paper to understand the initial conditions of Your simulation better.

#### Start by selecting how many bodies do You want to place in the simulation.

#### Define each body by describing (from the right) its mass, radius, position (separate x and y coordinate) and initial velocity (separate x and y coordinate).

Important thing to notice is that all the input should be in float type, that means with a dot: '.', not a period ','.

Also note that each input is considered in SI units([s], [m], [kg]).

#### After that You have to have to define the length of Your simulation and Δt

This argument defines how precise the simulation in calculated. Small Δt indicates precise calculations. For short simulations you should keep Δt about 10 ^(-1). The longer the simulation the bigger the Δt.

#### Your simulation is now properly defined. Now You need to define the length of the animation. Of course in seconds.

Unfortunately Julia has some problems with high fps values. That means You cannot condense an hour of simulation into a 5 second gif :(.

#### Lastly, if You want to You can plot two graphs: a(t) and v(t).

#### When You check v(t) for example You will be asked to say when to start plotting and when to stop. It just means which time period You want to plot.

Note that the timespan of Your plots must be contained in the timespan of the simulation.

#### If You want to plot or animate other situation click the Clear button.

## Congratulations, that's all! Now just click Start and give the program some time.
