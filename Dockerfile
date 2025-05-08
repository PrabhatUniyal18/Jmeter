# Use OpenJDK as base image
FROM openjdk:11-jre-slim

# Set JMeter version
ENV JMETER_VERSION 5.6.3

# Set working directory
WORKDIR /opt

# Install required packages and download JMeter
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xvzf apache-jmeter-${JMETER_VERSION}.tgz && \
    rm apache-jmeter-${JMETER_VERSION}.tgz && \
    ln -s apache-jmeter-${JMETER_VERSION} jmeter

# Set environment variable
ENV JMETER_HOME /opt/jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Default command to show JMeter version
CMD ["jmeter", "--version"]
