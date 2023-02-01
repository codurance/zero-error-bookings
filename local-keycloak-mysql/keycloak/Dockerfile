FROM quay.io/keycloak/keycloak:20.0.3

ADD UserStorageSPI.jar /opt/keycloak/providers

RUN /opt/keycloak/bin/kc.sh build --db=mysql

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]