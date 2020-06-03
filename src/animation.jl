include("simulation.jl")
using Plots


"""
    draw(data::Array{Body, 2}, s::Simulation, limits::Vector) -> gif(a::Animation,::String,fps::Float64)

Makes and saves an animation as animation.gif.
Acquires limits vector in form: [xmin, xmax, ymin, ymax]
"""
draw(data::Array{Body, 2}, s::Simulation, limits::Vector) = begin
    Δt = s.Δt
    a = @animate for i in 1:size(data)[1]
        plot()
        for j in 1:size(data)[2]
            scatter!([data[i,j].position[1]], [data[i,j].position[2]],
            markersize = data[i,j].radius,
            title = "Simulation",
            xlim = (limits[1], limits[2]),
            ylim = (limits[3], limits[4]),
            xlabel = "X",
            ylabel = "Y",
            label = "Body $j")
            plot!([data[i,j].position[1],data[i,j].position[1]+data[i,j].velocity[1]],
            [data[i,j].position[2],data[i,j].position[2]+data[i,j].velocity[2]],
            arrow = 0.4,
            label = "v$j")
        end
    end
    gif(a, "animation.gif", fps=1/Δt)
end


"""
    graph(data::Array{Body, 2}, s::Simulation, type::String, time::Vector) -> savefig(::String)

Makes and saves plots v(t) and a(t) as v.png and a.png.
Acquires information what kind of plot to draw: "v" for v(t) and "a" for a(t).
"""
graph(data::Array{Body, 2}, s::Simulation, type::String, time::Vector) = begin
    plot()
    Δt = s.Δt
    first_frame = ceil(Int,time[1]/Δt)
    last_frame = floor(Int,time[2]/Δt)
    v = []
    a = []
    xs = first_frame*Δt:Δt:last_frame*Δt
    for i in 1:size(data)[2]
        for j in first_frame+1:last_frame+1
            append!(v,sqrt(data[j,i].velocity[1]^2+data[j,i].velocity[2]^2))
            append!(a,sqrt(data[j,i].acceleration[1]^2+data[j,i].acceleration[2]^2))
        end
    end
    if type == "v" #dla v(t)
        for i in 1:size(data)[2]
            plot!(xs,v[1+(last_frame-first_frame+1)*(i-1):(last_frame-first_frame+1)*i],
            title = "v(t)",
            xlabel = "t",
            ylabel = "v(t)",
            label = "Body $i")
        end
        savefig("v.png")
    elseif type == "a" #dla a(t)
        for i in 1:size(data)[2]
            plot!(xs,a[1+(last_frame-first_frame+1)*(i-1):(last_frame-first_frame+1)*i],
            title = "a(t)",
            xlabel = "t",
            ylabel = "a(t)",
            label = "Body $i")
        end
        savefig("a.png")
    end
end


# test
#Do rysowania animacji potrzebujemy wektora limits, gdzie jest on postaci:
# [xmin,xmax,ymin,ymax] <- xmin...ymax podaje użytkownik (w gui)
#Trzeba to w odpowiedzni sposób uwzględnić podczas wywoływania draw(...)
# a = Body(1, [0; 0], 5, 100000000000,[0,-1])
# b = Body(1, [-5; -5], 2, 5,[0,0.5])
# c = Body(1, [5; 5], 2, 4,[0,-0.5])
# u = [a; b; c]
# s = Simulation(u,0.5,25,0)
# r = run!(s)
# graph(r,s,"a",[0,5]) #a(t)
# graph(r,s,"v",[0,5]) #v(t)
# draw(r,s) #<= wersja testowa dla sił; docelowo draw(s,limit)
# test
