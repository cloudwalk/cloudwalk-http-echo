FROM greglearns/ruby

RUN gem install bundler
EXPOSE 5000
ENV PORT 5000
ADD . /opt/cloudwalk-http-echo/
RUN cd /opt/cloudwalk-http-echo && bundle install
CMD ["/usr/local/bin/foreman","start","-d","/opt/cloudwalk-http-echo"]
