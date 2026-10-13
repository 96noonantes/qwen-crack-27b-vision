FROM ghcr.io/ggml-org/llama.cpp:server-cuda

# Qwen3.8-27B CRACK (vision-language, uncensored) baked into image layer.
# Includes the text model + vision projector (mmproj) so the same server serves
# both text chat and image understanding.
# The llama.cpp server image entrypoint consumes LLAMA_ARG_* env vars
# (see /entrypoint.sh in the base image), so the same env scheme keeps working;
# vision is enabled by passing LLAMA_ARG_MMPROJ=/models/mmproj.gguf.
ARG MODEL_URL
ARG MMPROJ_URL

RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && mkdir -p /models \
    && curl -sL --retry 3 --fail -o /models/model.gguf "$MODEL_URL" \
    && curl -sL --retry 3 --fail -o /models/mmproj.gguf "$MMPROJ_URL" \
    && rm -rf /var/lib/apt/lists/* \
    && ls -la /models