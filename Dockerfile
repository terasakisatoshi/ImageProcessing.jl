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

USER root

RUN cp -r /root/.julia/packages/OpenCV ${HOME}/.julia/packages/OpenCV
RUN chown -R ${NB_UID} ${HOME}/.julia/packages/OpenCV

USER ${NB_USER}

RUN julia -e 'using Pkg; pkg"dev ~/.julia/packages/OpenCV"; Pkg.precompile(); using OpenCV'

WORKDIR ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

EXPOSE 8888
