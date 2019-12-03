## Servidor PPTPD 

Permite implementar rapidamente un servidor PPTPD para usarlo con equipos Mikrotik

## Ejecutar Servidor PPTPD

Es necesario crear el archivo de configuracion para los usuarios, podemos usar el siguiente enjemplo:

# Secrets for authentication using CHAP
# client	server	secret			IP addresses


Ahora lanzamos el servicio:

docker run --name=pptpd --net=host --restart=always -v /data/apps/pptpd/chap-secrets:/etc/ppp/chap-secrets:ro -d nsoporte/pptpd
