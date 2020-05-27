include("simulation.jl")
using Plots

draw(o::Vector{Body},frames) = begin
    scatter()
    a = @animate for i in range(1,frames)
        for j in o
            scatter!([j.position[1]],[j.position[2]],
            markersize=j.radius)
        end
        update(o)
    end
end

# test
# a = Body(0, [0; 0], 0, 1000000000)
# b = Body(1, [-1; -1], 0, 4)
# u = [a; b]
# draw(u,25)
# test
