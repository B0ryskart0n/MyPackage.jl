include("simulation.jl")
using Plots


"""
    draw(data::Array{Float64, 3}, Δt::Float64) -> gif(a::Animation,::String,fps::Float64)

Makes and saves an animation as animation.gif.
"""
draw(data::Array{Float64, 3}, Δt::Float64) = begin
    r_max = maximum(data[2, :, :])
    x_min = minimum(data[3, :, :]) - r_max
    x_max = maximum(data[3, :, :]) + r_max
    y_min = minimum(data[4, :, :]) - r_max
    y_max = maximum(data[4, :, :]) + r_max
    a = @animate for i in 1:size(data)[3]
        plot()
        for j in 1:size(data)[2]
            scatter!([data[3, j, i]], [data[4, j, i]],
            markersize = data[2, j, i],
            title = "Simulation",
            xlim = (x_min, x_max),
            ylim = (y_min, y_max),
            xlabel = "X",
            ylabel = "Y",
            label = "Body $j")
            plot!([data[3, j, i], data[3, j, i] + data[5, j, i]],
            [data[4, j, i], data[4, j, i] + data[6, j, i]],
            arrow = 0.5,
            label = "v$j")
        end
    end
    gif(a, "animation.gif", fps=1/Δt)
end


"""
    graph(data::Array{Body, 2}, Δt::Float64, type::String, time::Vector) -> savefig(::String)

Makes and saves plots v(t) and a(t) as v.png and a.png.
Acquires information what kind of plot to draw: "v" for v(t) and "a" for a(t).
"""
graph(data::Array{Float64, 3}, Δt::Float64, type::String, time::Vector) = begin
    plot()
    first_frame = ceil(Int,time[1]/Δt)
    last_frame = floor(Int,time[2]/Δt)
    Δf = last_frame - first_frame + 1
    xs = first_frame*Δt:Δt:last_frame*Δt
    v = Array{Float64,2}(undef,size(data)[2],Δf)
    a = Array{Float64,2}(undef,size(data)[2],Δf)
    for i in 1:size(data)[2]
        for j in 1:Δf
            v[i, j] = sqrt(data[5, i, j + first_frame]^2+data[6, i, j + first_frame]^2)
            a[i, j] = sqrt(data[7, i, j + first_frame]^2+data[8, i, j + first_frame]^2)
        end
    end
    if type == "v" #dla v(t)
        for i in 1:size(v)[1]
            plot!(xs, v[i, :],
            title = "v(t)",
            xlabel = "t[s]",
            ylabel = "v(t)[m/s]",
            label = "Body $i")
        end
        savefig("v.png")
    elseif type == "a" #dla a(t)
        for i in 1:size(a)[1]
            plot!(xs, a[i, :],
            title = "a(t)",
            xlabel = "t[s]",
            ylabel = "a(t)[m/s]",
            label = "Body $i")
        end
        savefig("a.png")
    end
end


# test
# b = [1.5; 4.0; 5.0; 0.0; 0.5; 0.0; 0.0; 0.0]
# c = [100000000000.0; 8.0; 5.0; 5.0; 0.0; 0.0; 0.0; 0.0]
# bodies = [b c]
# t = 0.1
# r = run(bodies, 50.0, t)
# graph(r,t,"a",[0,40]) #a(t)
# graph(r,t,"v",[0,40]) #v(t)
# draw(r,t)
#test
