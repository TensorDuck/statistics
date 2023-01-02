module Stats

export sample

function sample(f::Array, n::Int)
    result = Array{eltype(f)}(undef, n)
    for i in 1:n
        result[i] = rand(f)
    end
    return result
end

end # module Stats
