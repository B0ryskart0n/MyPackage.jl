struct Universe
    bodies::Array{Body, 1}
end

mutable struct Body
    movable::Bool
    x::Float64
    y::Float64
    radius::Float64
    mass::Float64
    acceleration::Vector{Float64}
    velocity::Vector{Float64}
    Body(b::Bool, x::Number, y::Number, r::Number, m::Number) =
        new(b, x, y, r, m, [0.0; 0.0], [0.0; 0.0])
end

distance(a::Body, b::Body) = sqrt(abs2(a.x - b.x) + abs2(a.y - b.y))

# in progress
update(a::Body, f::Array{Float64, 1}) = begin
    if a.movable
        a.acceleration = f ./ a.mass
        a.velocity += a.acceleration
        a.x += a.velocity[1]
        a.y += a.velocity[2]
    end
end
# in progress

# in progress
update(w::World) = begin
    for (index, body) in enumerate(w.bodies)
        force = [0; 0]
        force += G * body.mass * w.bodies.mass
    end
end
# in progress
