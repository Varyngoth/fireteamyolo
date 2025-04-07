# Use a base image with ROCm and PyTorch
FROM rocm/pytorch:rocm5.7_ubuntu22.04_py3.10_pytorch_2.1.0

# Set working directory
WORKDIR /workspace

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    curl \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Clone YOLOv5 (change to YOLOv8 or custom repo as needed)
RUN git clone https://github.com/ultralytics/yolov5.git
WORKDIR /workspace/yolov5

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Default command
CMD ["bash"]
