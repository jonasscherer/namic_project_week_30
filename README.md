# NAMIC Project Week 2019

## Send example images to dcm4chee
sudo docker run --rm --network=host dcm4che/dcm4che-tools:5.15.1 storescu -cDCM4CHEE@192.168.99.100:31112 /opt/dcm4che/etc/testdata/dicom

## Start minikube

minikube start --extra-config=apiserver.ServerRunOptions.ServiceNodePortRange=1-30000
