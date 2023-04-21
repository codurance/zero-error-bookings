FROM quay.io/keycloak/keycloak:20.0.3

# Add custom kubeping configuration file
ADD cache-ispn-kubeping.xml /opt/keycloak/conf

# Add JGroups KubePing extension
ADD jgroups-kubernetes-1.0.16.Final.jar /opt/keycloak/providers

ADD /build/libs/UserStorageSPI.jar /opt/keycloak/providers
ADD /theme/ /opt/keycloak/themes/webbeds

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
