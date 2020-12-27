FROM rocker/r-base:latest

RUN mkdir /home/analysis

RUN R -e "install.packages('data.table')"

RUN R -e "install.packages('ggplot2')"

RUN R -e "install.packages('ggpmisc')"

RUN R -e "install.packages('scales')"

RUN R -e "install.packages('dplyr')"

RUN apt-get -y update

RUN apt-get -y install git

RUN apt-get -y install curl

RUN git clone https://github.com/rayashu-orna/LibraryQuant.git /home/git

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate

