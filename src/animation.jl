include("simulation.jl")
using Plots

draw(s::Simulation,frames) = begin
    scatter()
    a = @animate for i in [1:frames]
        update!(s)
        for j in s.bodies
            scatter!([j.position[1]],[j.position[2]],
            markersize=j.radius)
        end
    end
    gif(a,"simulation.gif",fps=2)
end

# test
a = Body(1, [0; 0], 5, 10000000)
b = Body(1, [-1; -1], 2, 4,[1,1])
u = [a; b]
s = Simulation(u,1,0)
draw(s,25)
# test
