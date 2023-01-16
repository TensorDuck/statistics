import Pkg
here = pwd() * "/Stats"

tempdir = mktempdir()
tempdir = "/tmp/Example0"
Pkg.activate(tempdir)
Pkg.add("Plots")
Pkg.add("StatsBase")
Pkg.develop(path=here)

import Plots
import StatsBase

# Stats will have overlapping names with StatsBase
import Stats

# X = water, Y = land
result = Stats.sample(['X', 'X', 'Y'], 3)
print("\n")
print(result)
print("\n")

posterior = Stats.binomial(result, 0.66)
print("\n")
print(posterior)
print("\n")

posterior = Stats.binomial(result, [0.0, 0.2, 0.4, 0.5, 0.6, 0.8, 1.0])
print("\n")
print(posterior)
print("\n")



p = Plots.plot(StatsBase.countmap(result), show=true)
#Plots.savefig("~/scratch/test")
display(p)