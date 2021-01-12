from terasakisatoshi/opencvjl
RUN julia -e 'ENV["PYTHON"]=""; using Pkg; Pkg.add(["PyCall", "IJulia"]); Pkg.precompile()'

EXPOSE 8888
