import Pkg
here = pwd() * "/Stats"

tempdir = mktempdir()
Pkg.activate(tempdir)
Pkg.add("Plots")
Pkg.add("StatsBase")
Pkg.develop(path=here)

import Plots
import StatsBase

# Stats will have overlapping names with StatsBase
using Stats


result = sample(['W', 'W', 'L'], 10)
print("\n")
print(result)

print("\n")

p = Plots.plot(StatsBase.countmap(result), show=true)
#Plots.savefig("~/scratch/test")
display(p)