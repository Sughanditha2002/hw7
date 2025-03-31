
FROM python:3.9-slim


WORKDIR /app/qrdocker


COPY main.py .

# Install necessary Python packages
RUN pip install qrcode[pil]

# Set environment variables with defaults
ENV QR_DATA_URL="https://github.com/Sughanditha2002"
ENV QR_CODE_DIR="qr_codes"
ENV QR_CODE_FILENAME="github_qr_code.png"
ENV FILL_COLOR="blue"
ENV BACK_COLOR="white"

# Create directory for QR codes
RUN mkdir -p /app/qrdocker/${QR_CODE_DIR}

# Entrypoint to run the QR code generator script
ENTRYPOINT ["python", "main.py"]