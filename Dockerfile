FROM openjdk

LABEL maintainer "guillermo.palli@gmail.com"
LABEL description "This file installs NextReports Desginer 9.2 into docker image."

RUN wget http://www.asf.ro/next_reports_releases/nextreports-designer-9.2.zip

RUN unzip nextreports-designer-9.2.zip

WORKDIR nextreports-designer-9.2

CMD ["java", "-Xms128m", "-Xmx1024m", "-cp", "lib/*:jdbc-drivers/*:.","ro.nextreports.designer.Main"]