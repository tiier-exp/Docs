FROM onlyoffice/documentserver:9.1.0.1

# Copy custom nginx configs
COPY configs/ds.conf /etc/onlyoffice/documentserver/nginx/ds.conf
COPY configs/ds-docservice.conf /etc/nginx/includes/ds-docservice.conf
