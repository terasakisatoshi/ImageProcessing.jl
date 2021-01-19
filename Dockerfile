from terasakisatoshi/opencvjl

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER ${NB_USER}

# set ENV["PYTHON"]="" to make install conda to setup Python environment.
RUN julia -e '\
ENV["PYTHON"]=""; \
using Pkg; Pkg.add(["PyCall", "IJulia", "Conda"]); \
using Conda; Conda.add(["jupyter", "jupyterlab"]); \
Pkg.precompile(); \
'

ENV PATH="${HOME}/.julia/conda/3/bin":${PATH}

EXPOSE 8888
