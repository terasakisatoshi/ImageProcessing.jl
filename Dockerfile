from terasakisatoshi/opencvjl

# set ENV["PYTHON"]="" to make install conda to setup Python environment.
RUN julia -e '\
ENV["PYTHON"]=""; \
using Pkg; Pkg.add(["PyCall", "IJulia", "Conda"]); \
using Conda; Conda.add(["jupyter", "jupyterlab"]); \
Pkg.precompile(); \
'

ENV PATH="/root/.julia/conda/3/bin":${PATH}

EXPOSE 8888
