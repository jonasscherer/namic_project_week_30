# NAMIC Project Week 2019

This repositroy was started as part of the NAMIC project week 30 @ Las Palmas Gran Canaria.
It contains some basic Kubernetes yaml files, which can be used to deploy:

- DCM4CHe pacs
- OHIF web-based dicom viewer
- Keycloak open-id-connect user management 

### Basic steps of installation:

1) Get **Minikube** and all dependencies running: https://kubernetes.io/docs/setup/minikube/

2) Go in the repository
```cd /deployment```
```kubectl apply -f ./* ```

3) Watch  ```kubectl get pods --all-namespaces``` 
-> all pods should be in the "running" state.
This could take some time - don't worry if something is crashing - it will be restarted automatically..

4) Go to https://192.168.99.102:30443/
You should see the the login-page. 
The default credentials are:
- For the normal login:
username: **namic**
password: **namic**

- For the keycloak admin login:
username: **admin**
password: **admin**

You can change all passwords with the Keycloak management:
https://192.168.99.102:30443/auth

### How to use?

The components have the the following urls:
1) OHIF: https://192.168.99.102:30443/ (root)
2) DCM4CHe https://192.168.99.102:30443/dcm4chee-arc/ui2
3) Keycloak: https://192.168.99.102:30033/auth/
4) Dicom receiver port is ```192.168.99.102:31112```
5) All data is stored inside the minikube vm (**/data_deployment**)

To push an example image to DCM4CHE with the **dcm4che-tools docker container**:
```sudo docker run --rm --network=host dcm4che/dcm4che-tools:5.15.1 storescu -cDCM4CHEE@192.168.99.102:31112 /opt/dcm4che/etc/testdata/dicom ```


### Further steps
- The HELM deployment is still missing - we will add this later
- Right now, this will just work in Minikube (IPs, ports etc. are hard-coded)
- Minikube is pretty slow
 We should make this compatible with any Kubernetes setup
- OHIF viewer will be updated 
- Instructions how to add a tls certificate

