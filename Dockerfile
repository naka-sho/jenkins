FROM centos:centos7

RUN yum update -y && \
    yum install -y epel-release && \
    yum upgrade -y

# java関連
RUN yum install -y java-1.8.0-openjdk-devel initscripts

# git関連
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y install git2u yum-utils && \
    yum-config-manager --disable ius

# php関連
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=remi,remi-php74 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt

#jenkinsの安定バージョン取得
WORKDIR /opt/jenkins/
RUN curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum -y install jenkins-2.204.2-1.1

EXPOSE 8080
CMD ["service", "jenkins", "start"]

