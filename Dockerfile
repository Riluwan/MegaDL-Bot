# Use a specific Debian version to avoid unexpected breaking changes from 'latest'
FROM debian:bookworm-slim

# Update package list and install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git python3-pip ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Clone the repository directly into the target directory
RUN git clone https://github.com/AsmSafone/MegaDL-Bot /MegaDL-Bot

# Set the working directory
WORKDIR /MegaDL-Bot

# Upgrade pip with --break-system-packages and install dependencies
RUN pip3 install --break-system-packages --upgrade pip && \
    pip3 install -U -r requirements.txt

# Run the bot
CMD ["python3", "main.py"]
