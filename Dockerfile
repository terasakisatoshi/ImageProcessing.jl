from terasakisatoshi/opencvjl

RUN julia -e 'using Pkg; Pkg.add(["PyCall", "IJulia"])'

EXPOSE 8888
