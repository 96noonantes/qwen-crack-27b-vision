# qwen-crack-27b-vision

llama.cpp server image with the **Qwen3.8-27B CRACK** model baked in:
vision-language + uncensored (NSFW-capable), Apache-2.0.

- Text model: [dealignai/Qwen3.8-27B-CRACK-GGUF](https://huggingface.co/dealignai/Qwen3.8-27B-CRACK-GGUF) · `Q4_K_M`
- Vision projector: `mmproj-Qwen3.8-27B-f16.gguf`

## Usage

The base `ghcr.io/ggml-org/llama.cpp:server-cuda` image entrypoint reads `LLAMA_ARG_*` env vars.
Point `LLAMA_ARG_MODEL=/models/model.gguf`, `LLAMA_ARG_MMPROJ=/models/mmproj.gguf`,
and pass the rest via `LLAMA_ARG_*` (host/port/n_gpu_layers/ctx etc.).

Example SaladCloud env:

```
LLAMA_ARG_HOST=::
LLAMA_ARG_PORT=8080
LLAMA_ARG_N_GPU_LAYERS=all
LLAMA_ARG_CTX_SIZE=16384
LLAMA_ARG_N_PARALLEL=1
LLAMA_ARG_MMPROJ=/models/mmproj.gguf
LLAMA_ARG_MODEL=/models/model.gguf
```