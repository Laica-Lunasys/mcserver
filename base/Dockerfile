FROM alpine:latest AS download_paper
WORKDIR /paper

RUN apk add --no-cache curl jq
COPY utils/paper.sh /paper/

# Download paper
RUN sh /paper/paper.sh 1.16.5
# ---
# ---
FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app
EXPOSE 25565
ENV LANG en_US.UTF-8

# Config
ENV SERVER_NAME unknown
ENV SERVER_ID unknown
ENV WHITE_LIST false
ENV ONLINE_MODE true

# Install paper
COPY --from=download_paper /paper/paper.jar /paper/

# Setup user
RUN chmod u+s /bin/*

# Copy Entry point
COPY entrypoint.sh /entrypoint.sh

# Copy plugins...
COPY app/ /app/

CMD ["bash", "/entrypoint.sh"]
#CMD ["java", "-jar", "/paper/paper.jar", "-nogui"]
