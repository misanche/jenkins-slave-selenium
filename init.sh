java -jar selenium-server-standalone-3.141.59.jar -role hub -timeout 0 -browserTimeout 0 & 
java -Dwebdriver.chrome.driver=chromedriver -jar selenium-server-standalone-3.141.59.jar -role node -hub http://localhost:4444/grid/register -browser "browserName=chrome,maxInstances=20" -maxSession 20 &

go-init -main /usr/local/bin/run-jnlp-client
