FROM tomcat:9.0-jdk17

# डीफॉल्ट ROOT फोल्डर साफ करा
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# फोल्डरच्या नावातील डॉट प्रमाणे अचूक पाथ द्या
COPY src.main.webapp/ /usr/local/tomcat/webapps/ROOT/

# शटडाउन पोर्ट बंद करा
RUN sed -i 's/port="8005"/port="-1"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]
