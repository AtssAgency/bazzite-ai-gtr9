# 1. Base Image
FROM ghcr.io/ublue-os/bazzite:stable

# 2. Install LLM & GPU Tools (ROCm for Strix Halo)
RUN rpm-ostree install \
    rocm-opencl \
    rocm-hip \
    rocm-clinfo \
    git-lfs \
    python3-pip

# 3. Add Ollama Binary
RUN curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama && \
    chmod +x /usr/bin/ollama

# 4. Clean up
RUN rpm-ostree cleanup -a
