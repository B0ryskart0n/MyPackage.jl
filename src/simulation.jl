using LinearAlgebra
# using Plots

const G = 6.6743e-11

"""
Celestial object.
"""
mutable struct Body
    movable::Bool
    position::Vector{Float64}
    radius::Float64
    mass::Float64
    velocity::Vector{Float64}
    acceleration::Vector{Float64}
    Body(b, p, r, m) = new(b, p, r, m, [0.0; 0.0], [0.0; 0.0])
    Body(b, p, r, m, v) = new(b, p, r, m, v, [0.0; 0.0])
end

Base.show(io::IO, a::Body) = begin
    return a.movable ?
        print(io, "Dynamic body:\n  position: $(
              a.position)\n  radius: $(
              a.radius)\n  mass: $(
              a.mass)\n  velocity: $(
              a.velocity)\n  acceleration: $(
              a.acceleration)") :
        print(io, "Static body:\n  position: $(
              a.position)\n  radius: $(
              a.radius)\n  mass: $(
              a.mass)\n  velocity: $(
              a.velocity)\n  acceleration: $(
              a.acceleration)")
end

"""
    update!(a::Body, f::Vector)

Update in place object a based on given force vector.
"""
update!(a::Body, f::Vector) = begin
    if a.movable
        a.acceleration = f ./ a.mass
        a.velocity += a.acceleration
        a.position += a.velocity
    end
end
"""
    update!(u::Vector{Body})

Update in place all bodies in Array.
Calculates gravity forces between bodies and updates them.
"""
update(u::Vector{Body}) = begin
    masses = getfield.(u, :mass)
    massesprod = masses .* permutedims(masses)
    positions = getfield.(u, :position)
    positionsdif = permutedims(positions) .- positions
    distances = norm.(positionsdif)
    distances2 = distances.^2
    versors = normalize.(positionsdif)
    forces = G * massesprod .* versors ./ distances2
    replace!(forces, [NaN, NaN]=>[0.0, 0.0])
    update.(u, sum(forces, dims=2))
end

# testing

# a = Body(0, [0; 0], 0, 1000000000)
# b = Body(1, [-1; -1], 0, 4)
# u = [a; b]
# scatter([a.position[1]], [a.position[2]], framestyle=:origin, color=:black, legend=:none)
# scatter!([b.position[1]], [b.position[2]], color=:red)
# for i in 1:15
#     update(u)
#     scatter!([b.position[1]], [b.position[2]], color=:red)
# end
# plot!()

# testing
