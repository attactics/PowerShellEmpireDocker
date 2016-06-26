FROM kalilinux/kali-linux-docker
MAINTAINER @evasiv3 (x [at] attactics.org | PGP 2AB3FA6FCA75105F)
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean && apt-get -y update
RUN apt-get -y install python git python-pip libssl-dev libffi-dev python-dev python-m2crypto swig lsb-release
RUN pip install pyopenssl
RUN mkdir /root/empire
ADD launch.sh /root/
RUN git clone https://github.com/PowerShellEmpire/Empire.git /root/empire
ENV STAGING_KEY=RANDOM
RUN bash -c "cd /root/empire/setup && /root/empire/setup/install.sh"
RUN chmod +x /root/launch.sh
CMD ["/root/launch.sh"]
