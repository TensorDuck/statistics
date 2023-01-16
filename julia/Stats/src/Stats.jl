module Stats

export sample
export binomial

function sample(f::Array, n::Integer)
    result = Array{eltype(f)}(undef, n)
    for i in 1:n
        result[i] = rand(f)
    end
    return result
end

function binomial(obs::Vector{Char}, p::Number)
    x, y = count_binomial(obs)
    return prefactor_binomial(x, y) * value_binomial(x, y, p)
end

function binomial(obs::Vector{Char}, p::Vector{<:Number})
    x, y = count_binomial(obs)
    return prefactor_binomial(x, y) .* map(val -> value_binomial(x, y, val), p)
end

function count_binomial(obs::Vector{Char})
    n_obs = size(obs, 1)
    x = 0
    y = 0
    for i in 1:n_obs
        if obs[i] == 'X'
            x += 1
        elseif obs[i] == 'Y'
            y += 1
        else
            throw(DomainError(obs[i], "obs must contain only the characters X and Y."))
        end
    end
    return x, y
end

function prefactor_binomial(x::Integer, y::Integer)
    return factorial(x + y) / (factorial(x) * factorial(y))
end

function value_binomial(x::Number, y::Number, p::Number)
    return (p^x) * ((1 - p)^y)
end


end # module Stats
