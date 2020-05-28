FROM ubuntu:latest

WORKDIR /zupTest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget \
                       gnupg2 \
                       dpkg \
                       unzip \
                       python3-pip \
                       python3-dev \
                       firefox

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

ENV WEBDRIVERS='/app/webdrivers'

RUN mkdir -p $WEBDRIVERS

ENV PATH=${PATH}:${WEBDRIVERS}

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz -P $WEBDRIVERS

RUN tar -xvzf $WEBDRIVERS/geckodriver* -C $WEBDRIVERS && \
    chmod +x $WEBDRIVERS/geckodriver

RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip -P $WEBDRIVERS

RUN unzip $WEBDRIVERS/chromedriver* -d $WEBDRIVERS && \ 
    chmod +x $WEBDRIVERS/chromedriver

COPY . /zupTest

RUN pip3 install -r /zupTest/requirements/requirements.txt

VOLUME [ "/zupTest/output" ]

ENTRYPOINT [ "python3", "driver/driver.py"]