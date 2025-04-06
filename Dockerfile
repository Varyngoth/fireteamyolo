FROM rocm/rocm-terminal:latest

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /workspace

# Install ROCm-compatible PyTorch
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.7

# Install Ultralytics YOLO
RUN pip3 install ultralytics

CMD [ "bash" ]
