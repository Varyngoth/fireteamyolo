FROM rocm/rocm-terminal:latest

# Switch to root user to have the necessary permissions
USER root

# Update apt and install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-distutils \
    && apt-get install -y python3.10 python3.10-distutils \
    && apt-get install -y software-properties-common

# Set up Python 3.10 as the default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# Install PyTorch and related dependencies for ROCm
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.7

# Install Ultralytics (YOLO library)
RUN pip3 install ultralytics

# Check Python version and installed packages
RUN python --version  # Should show Python 3.10
RUN pip3 show ultralytics  # Should show installed ultralytics package

# Set the working directory
WORKDIR /workspace

# Add any other setup steps (like installing your requirements)
# Example: RUN pip3 install -r requirements.txt
