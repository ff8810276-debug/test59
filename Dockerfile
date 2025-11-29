FROM python:3.10

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download model instead of COPY
# ❗ این لینک را با لینک واقعی مدل خودت جایگزین کن
RUN apt-get update && apt-get install -y wget && \
    wget https://huggingface.co/YOUR_MODEL_PATH/qwen2.5-0.5b-instruct-q4_k_m.gguf \
    -O /app/model.gguf

# Copy the rest of project files
COPY . .

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
