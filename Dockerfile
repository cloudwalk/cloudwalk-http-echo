FROM greglearns/ruby

RUN git clone https://github.com/planobe/cloudwalk-http-echo.git /opt/cloudwalk-http-echo/
RUN gem install bundler
EXPOSE 5000
ENV PORT 5000
RUN cd /opt/cloudwalk-http-echo && git pull && bundle install
CMD ["/usr/local/bin/foreman","start","-d","/opt/cloudwalk-http-echo"]
