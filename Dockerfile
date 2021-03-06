FROM centos:latest
MAINTAINER Marco Bazzani <mbazzani@doxee.com>

WORKDIR "/root"
RUN yum -y install wget nc
RUN wget https://app2.informaticacloud.com/saas/download/linux64/installer/agent64_install.bin
#RUN wget http://172.16.1.108/saas/download/linux64/installer/agent64_install.bin
RUN chmod +x /root/agent64_install.bin
RUN echo -e "\n\n\n\n" | /root/agent64_install.bin || echo OK
WORKDIR "/root/infaagent"
COPY setup.sh /root/infaagent/setup.sh
COPY client.sh /root/infaagent/client.sh
COPY docker_agent_start.sh /root/infaagent/docker_agent_start.sh
RUN chmod +x setup.sh
RUN chmod +x client.sh
RUN chmod +x docker_agent_start.sh
#RUN ./setup.sh
#RUN echo "InfaAgent.MasterUrl=https://app.informaticaondemand.com/ma" > /root/infaagent/main/infaagent.ini

ENTRYPOINT [ "/root/infaagent/docker_agent_start.sh" ]


