FROM centos:7

WORKDIR /my_scripts/
COPY your_selenium_script.py /my_scripts
COPY running.py /my_scripts
COPY requirements.txt /my_scripts

RUN yum update -y
RUN yum install -y wget
RUN yum install -y unzip
# install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN yum localinstall -y google-chrome-stable_current_x86_64.rpm
# install webdriver for chrome
RUN wget --no-check-certificate https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/115.0.5790.102/linux64/chromedriver-linux64.zip
RUN unzip chromedriver-linux64.zip
RUN rm chromedriver-linux64.zip
RUN yum install -y python3
# for psycopg2
RUN yum groupinstall -y "Development Tools"
RUN yum install -y python3-devel
RUN yum install -y postgresql-libs
RUN yum install -y postgresql-devel
# all reqs
RUN pip3 install -r requirements.txt

CMD ["python3", "running.py"]
