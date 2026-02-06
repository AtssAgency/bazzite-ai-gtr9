FROM ghcr.io/ublue-os/bazzite:stable

# 1. Install LLM & GPU Tools
# Combined into one RUN to reduce layers and prevent cache errors
RUN rpm-ostree install \
    rocm-opencl \
    rocm-hip \
    rocm-clinfo \
    git-lfs \
    python3-pip && \
    rpm-ostree cleanup -a

# 2. Add Ollama Binary
# Using -L to follow redirects and --retry for network stability
RUN curl -L --retry 3 https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama && \
    chmod +x /usr/bin/ollama

# 3. Ensure directories exist for local scripts (prevents "no such file" errors)
RUN mkdir -p /usr/bin /usr/lib/systemd/system
