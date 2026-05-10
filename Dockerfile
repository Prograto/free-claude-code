FROM python:3.11-slim

WORKDIR /app

# Install uv
RUN pip install uv

# Copy project files
COPY . .

# Install dependencies
RUN uv sync --no-dev

# Expose port (HuggingFace requires 7860)
EXPOSE 7860

# Set default env
ENV PORT=7860

# Run the proxy
CMD ["uv", "run", "python", "server.py"]
