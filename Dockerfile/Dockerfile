FROM ubuntu:latest

# Create new directory and set it for work
RUN mkdir -p /home/app
WORKDIR /home/app

# Update + install wget, download Syncplay .deb file and install it
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/Syncplay/syncplay/releases/download/v1.6.9/syncplay-server_1.6.9.deb && \
    apt install -y /home/app/syncplay-server_1.6.9.deb

# Add group + user
RUN groupadd -r app &&\
    useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

# Change the owner of the directory to user "app"
RUN chown -R app:app /home/app

# Run Container as user "app"
USER app

# Expose port
EXPOSE 8088
