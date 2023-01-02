import Pkg
here = pwd() * "/Stats"

tempdir = mktempdir()
Pkg.activate(tempdir)
Pkg.develop(path=here)

using Stats

result = sample(['W', 'L'], 10)
print("\n")
print(result)

print("\n")