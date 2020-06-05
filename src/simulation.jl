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
    update!(a::Body, f::Vector{Float64}, Δt::Float64) -> a::Body

Update Body in place based on given force vector.
"""
update!(a::Body, f::Vector{Float64}, Δt::Float64) = begin
    if a.movable
        a.acceleration = f ./ a.mass
        a.velocity += a.acceleration * Δt
        a.position += a.velocity * Δt
    end

    return a
end

mutable struct Simulation
    bodies::Vector{Body}
    Δt::Float64
    timespan::Float64
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
    update!(s::Simulation) -> s::Simulation

Update all bodies in the simulation in place.
Calculates gravity forces between bodies and updates them.
Checks for collisions.
"""
update!(s::Simulation) = begin
    masses::Vector{Float64} = getfield.(s.bodies, :mass)
    masses_product::Matrix{Float64} = masses .* permutedims(masses)

    positions::Vector{Vector{Float64}} = getfield.(s.bodies, :position)
    positions_differences::Matrix{Vector{Float64}} = permutedims(positions) .- positions
    versors = normalize.(positions_differences)

    distances_squared = norm.(positions_differences).^2

    forces::Matrix{Vector{Float64}} = G .* masses_product .* versors ./ distances_squared
    replace!(forces, [NaN; NaN] => [0.0; 0.0])

    update!.(s.bodies, sum(forces, dims=2), s.Δt)

    if s.collisions
        radii::Vector{Float64} = getfield.(s.bodies, :radius)
        collision_distances = radii .+ permutedims(radii)

        new_positions::Vector{Vector{Float64}} = getfield.(s.bodies, :position)
        new_distances::Matrix{Float64} = norm.(permutedims(new_positions) .- new_positions)

        collisions = new_distances .< collision_distances
        which_collide(collisions)
    end

    return s
end

"""
    run!(s::Simulation) -> data::Array{Body, 2}

Return the data of bodies collected in each frame of simulation.
"""
run!(s::Simulation) = begin
    num_of_frames = 1 + div(s.timespan, s.Δt) |> Int

    data = Array{Body, 2}(undef, length(s.bodies), num_of_frames)

    data[:, 1] = deepcopy(s.bodies)
    for i in 2:num_of_frames
        data[:, i] = deepcopy(update!(s).bodies)
    end

    return data
end
