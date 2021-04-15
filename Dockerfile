FROM tensorflow/tensorflow:2.3.0-gpu
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      libgl1-mesa-dev \
      bzip2 \
      g++ \
      git \
      graphviz \
      libgl1-mesa-glx \
      libhdf5-dev \
      openmpi-bin \
      python3-pyqt5 \
      wget \
      python3-tk && \
    rm -rf /var/lib/apt/lists/*


# Setting up working directory 
RUN mkdir /src
COPY . /src
WORKDIR /src

RUN pip install --upgrade pip

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements.txt

ENV PYTHONPATH='/src/:$PYTHONPATH'

ENV QT_X11_NO_MITSHM=1

# Minimize image size 
RUN (apt-get autoremove -y; \
     apt-get autoclean -y)


CMD ["bash"]


