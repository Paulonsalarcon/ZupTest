FROM ubuntu:latest

WORKDIR /zupTest

ARG INCLUDE_TAGS=""
ARG EXCLUDE_TAGS=""
ARG BROWSER="headlesschrome"
ARG NUMBER_OF_PROCESSES="1"
ARG NAME=""

RUN apt-get install -y wget

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update
RUN apt-get install -y python3-pip \
                       python3-dev \
                       firefox \
                       google-chrome-stable


ENV WEBDRIVERS="/app/webdrivers"

RUN mkdir $WEBDRIVERS

RUN export PATH=$PATH:$WEBDRIVERS

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz -P $WEBDRIVERS

RUN tar -xvzf $WEBDRIVERS/geckodriver* -C $WEBDRIVERS && \
    chmod +x $WEBDRIVERS/geckodriver

RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip -P $WEBDRIVERS

RUN unzip $WEBDRIVERS/chromedriver* -d $WEBDRIVERS && \ 
    chmod +x $WEBDRIVERS/chromedriver

COPY . /zupTest

VOLUME [ "/zupTest/output" ]

CMD [ "run_tests.sh" ]