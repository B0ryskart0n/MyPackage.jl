using LinearAlgebra

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
        print(io, "Dynamic body:\n position: $(
              a.position)\n radius: $(
              a.radius)\n mass: $(
              a.mass)\n velocity: $(
              a.velocity)\n acceleration: $(
              a.acceleration)") :
        print(io, "Static body:\n position: $(
              a.position)\n radius: $(
              a.radius)\n mass: $(
              a.mass)\n velocity: $(
              a.velocity)\n acceleration: $(
              a.acceleration)")
end

"""
    update!(a::Body, f::Vector)

Update Body in place based on given force vector.
"""
update!(a::Body, f::Vector, Δt) = begin
    if a.movable
        a.acceleration = f ./ a.mass
        a.velocity += a.acceleration / Δt
        a.position += a.velocity / Δt
    end
end

mutable struct Simulation
    bodies::Vector{Body}
    Δt::Float64
    collisions::Bool
end
"""
    which_collide(collisions::BitArray)

Inform if any collisions occur(excluding one with itself).
"""
which_collide(collisions::BitArray) = begin
    for (i, body) in enumerate(eachrow(collisions))
        for (j, other) in enumerate(body[i+1:end])
            if other
                @info i, j+1
            end
        end
    end
end

"""
    update!(s::Simulation)

Update all bodies in the simulation in place.
Calculates gravity forces between bodies and updates them.
Checks for collisions.
"""
update!(s::Simulation) = begin
    masses = getfield.(s.bodies, :mass)
    masses_product = masses .* permutedims(masses)

    positions = getfield.(s.bodies, :position)
    positions_differences = permutedims(positions) .- positions
    versors = normalize.(positions_differences)

    distances = norm.(positions_differences)
    distances_squared = distances.^2

    forces = G * masses_product .* versors ./ distances_squared
    replace!(forces, [NaN, NaN]=>[0.0; 0.0])

    update!.(s.bodies, sum(forces, dims=2), s.Δt)

    if s.collisions
        radii = getfield.(s.bodies, :radius)
        collision_distances = radii .+ permutedims(radii)

        new_positions = getfield.(s.bodies, :position)
        new_positions_differences = permutedims(new_positions) .- new_positions
        new_distances = norm.(new_positions_differences)

        collisions = new_distances .< collision_distances
        which_collide(collisions)
    end
end
