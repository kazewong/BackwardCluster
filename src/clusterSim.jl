using StatsBase

initial_population = rand(1000)
global_history = zeros(Float64,(0,3))

function mergePopulation(population, history)
    pop_size = size(population)[1]
    index = sort(sample(1:pop_size, 2, replace = false))
    new_mass = sum(population[index])
    history = cat(history,reshape([population[index]...,sum(population[index])],1,3), dims=1)
    deleteat!(population,index)
    push!(population,new_mass)
    return history
end

for i in 1:200
    global global_history = mergePopulation(initial_population,global_history)
end