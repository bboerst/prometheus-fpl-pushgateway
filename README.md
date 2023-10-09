# prometheus-fpl-pushgateway

Python script that makes an API call to Florida Power and Light (FPL) 

Script requires this existing secret to exist:
```
kubectl create secret generic fpl-credentials \
--from-literal=username=your@username.com \
--from-literal=password=yourrealpassword \
-n cron
```

To install:
```
helm upgrade --install prometheus-fpl-pushgateway ./deploy/helm --namespace cron
```