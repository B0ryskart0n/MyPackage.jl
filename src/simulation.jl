const G = 6.6743e-11

"""
    update(bodies::Matrix{Float64}, Δt::Float64) -> bodies::Matrix{Float64}

Return updated bodies.
Calculates gravity forces between bodies and updates them accordingly.
All the calculations are based on Newton's law of universal gravitation.
"""
update(bodies::Matrix{Float64}, Δt::Float64) = begin
    masses = bodies[1, :]
    masses_product = masses .* transpose(masses)

    xs = bodies[3, :]
    ys = bodies[4, :]
    Δxs = transpose(xs) .- xs
    Δys = transpose(ys) .- ys

    scalar = @. (Δxs ^2 + Δys ^2) ^(3/2)
    replace!(scalar, 0.0 => Inf) # because of division by 0 later

    forces_x = @. G * masses_product * Δxs / scalar
    forces_y = @. G * masses_product * Δys / scalar

    bodies[7, :] = -transpose(sum(xforces, dims=1)) ./ masses # acceleration_x
    bodies[8, :] = -transpose(sum(yforces, dims=1)) ./ masses # acceleration_y
    bodies[5, :] += bodies[7, :] .* Δt # velocity_x
    bodies[6, :] += bodies[8, :] .* Δt # velocity_y
    bodies[3, :] += bodies[5, :] .* Δt # position_x
    bodies[4, :] += bodies[6, :] .* Δt # position_y

    return bodies
end

"""
    run(bodies::Matrix{Float64}, timespan::Float64, Δt::Float64) -> data::Array{Float64,3}

Return the data of bodies collected in each frame of simulation.
"""
run(bodies::Matrix{Float64}, timespan::Float64, Δt::Float64) = begin
    num_of_frames = 1 + div(timespan, Δt) |> Int

    data = Array{Float64, 3}(undef, size(bodies)[1], size(bodies)[2], num_of_frames)

    data[:, :, 1] = bodies
    for i in 2:num_of_frames
        data[:, :, i] = update(data[:, :, i-1], Δt)
    end

    return data
end
