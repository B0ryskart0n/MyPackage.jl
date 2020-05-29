include("simulation.jl")
using Plots

draw(s::Simulation,limit) = begin
    wykr = scatter([NaN],[NaN],
        title = "Simulation",
        xlim = (limit[1], limit[2]),
        ylim = (limit[3], limit[4]),
        xlabel = "X",
        ylabel = "Y",
        label = :none)
    iter = 1
    for j in s.bodies
        scatter!(wykr,[j.position[1]],[j.position[2]],
            markersize=j.radius,
            label = "Body $iter")
        plot!([j.position[1],j.position[1]+j.velocity[1]],
        [j.position[2],j.position[2]+j.velocity[2]],
        arrow = 0.4,
        label = "v$iter")
        iter += 1
    end
    display(wykr)
end

limits(s::Simulation) = begin
    positions = getfield.(s.bodies, :position)
    minx = positions[1][1]
    maxx = positions[1][1]
    miny = positions[1][2]
    maxy = positions[1][2]
    for position in positions
        if position[1]<minx
            minx = position[1]
        end
        if position[1]>maxx
            maxx = position[1]
        end
        if position[2]<miny
            miny = position[2]
        end
        if position[2]>maxy
            maxy = position[2]
        end
    end
    scale = 0.2
    minx -= scale * (maxx - minx)
    maxx += scale * (maxx - minx)
    miny -= scale * (maxy - miny)
    maxy += scale * (maxy - miny)
    return [minx,maxx,miny,maxy]
end

# test
a = Body(1, [0; 0], 5, 10000,[0.5,0])
b = Body(1, [-1; -1], 2, 4,[1,1])
u = [a; b]
s = Simulation(u,1,0)
limit = limits(s)
for i in 1:10
    draw(s,[-2,6,-2,6]) #<= wersja testowa dla sił; docelowo draw(s,limit)
    update!(s)
    sleep(2)
end
# test
