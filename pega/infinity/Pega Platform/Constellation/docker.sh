docker run -p 3443:3443 -v /Users/gurubrahmanadamekambaram/Desktop/peony/LSA/pega/installations/23/cs/apache-tomcat-9.0.74/certs:/host_folder --name c11n-appstatic pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image:1.5.0-20231012160646 port=3443 root=/usr/src/app/dist urlPath=/c11n-appstatic httpsKey=/host_folder/tomcat.key httpsCert=/host_folder/tomcat.crt



# CDN Service
docker run -p 1081:1080 pega-docker.downloads.pega.com/constellationui/cdn-onprem:8.8.4-ga-14

docker run -p 1081:1080 pega-docker.downloads.pega.com/constellationui/cdn-onprem:8.23.0-ga-100

docker run -p 1081:1080 pega-docker.downloads.pega.com/constellationui/cdn-onprem:24.1.0-ga-28


http://localhost:1081/

http://localhost:1081/8.23.0-ga-100/react/prod/buildinfo.json


cd /usr/share/nginx/static/react/prod

cd /usr/share/nginx/static/react/prod/
