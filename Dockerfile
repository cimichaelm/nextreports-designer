FROM openjdk

LABEL maintainer "guillermo.palli@gmail.com"
LABEL description "This file installs NextReports Desginer 9.2 into docker image."

# install packages
RUN apt-get update -y && apt-get install -y \
\
    nano \
    git \
    wget \
    make \
    aptitude \
    emacs \
    unzip \
 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://www.asf.ro/next_reports_releases/nextreports-designer-9.2.zip

RUN unzip nextreports-designer-9.2.zip

WORKDIR nextreports-designer-9.2

CMD ["java", "-Xms128m", "-Xmx1024m", "-cp", "lib/*:jdbc-drivers/*:.","ro.nextreports.designer.Main"]