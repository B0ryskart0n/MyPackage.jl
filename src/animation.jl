include("simulation.jl")
using Plots

"""
    draw(data::Array{Body, 2},Δt::Float64) -> gif(a::Animation,::String,fps::Float64)

Makes and saves an animation as animation.gif.
"""
draw(data,Δt) = begin
    a = @animate for i in 1:size(data)[1]
        plot()
        for j in 1:size(data)[2]
            scatter!([data[i,j].position[1]],[data[i,j].position[2]],
            markersize=data[i,j].radius,
            title = "Simulation",
            xlim = (-10,10),
            ylim = (-10,10),
            xlabel = "X",
            ylabel = "Y",
            label = "Body $j")
            plot!([data[i,j].position[1],data[i,j].position[1]+data[i,j].velocity[1]],
            [data[i,j].position[2],data[i,j].position[2]+data[i,j].velocity[2]],
            arrow = 0.4,
            label = "v$j")
        end
    end
    gif(a,"animation.gif",fps=1/Δt)
end



# test
a = Body(1, [0; 0], 5, 100000000000,[0,-1])
b = Body(1, [-5; -5], 2, 5,[0,0.5])
c = Body(1, [5; 5], 2, 4,[0,-0.5])
u = [a; b; c]
s = Simulation(u,0.5,25,0)
draw(run!(s),s.Δt) #<= wersja testowa dla sił; docelowo draw(s,limit)
# test
