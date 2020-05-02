FROM amazoncorretto:11

RUN yum install -y shadow-utils  && \
    groupadd --gid 9090 my-app && \
    useradd --uid 9090 --gid my-app --shell /bin/bash --create-home my-app && \
    yum clean all

CMD "/usr/local/bin/my-app"

COPY target/*.jar /usr/local/bin/my-app
RUN chmod a+x /usr/local/bin/my-app

USER my-app
