FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN pip install --default-timeout=1000 --no-cache-dir flask requests

# Create Flask app structure
RUN mkdir -p templates

# Copy files
COPY app.py .
COPY simulator.py .
COPY templates/index.html templates/index.html

# Create startup script to run both Flask and simulator
RUN echo '#!/bin/bash\n\
python app.py &\n\
FLASK_PID=$!\n\
echo "Waiting for Flask to start..."\n\
sleep 3\n\
python simulator.py &\n\
SIM_PID=$!\n\
echo "Flask PID: $FLASK_PID"\n\
echo "Simulator PID: $SIM_PID"\n\
wait $FLASK_PID' > start.sh && chmod +x start.sh

EXPOSE 5000

CMD ["bash", "start.sh"]
