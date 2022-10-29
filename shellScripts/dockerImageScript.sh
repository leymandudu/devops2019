#!/usr/bin/env bash

#LABEL script to build docker image, dockerfile and delete unused files

echo "What is the name of your workspace directory?: "

read folderName

mkdir ${folderName} && cd ${folderName} && touch Dockerfile

echo "What is your base image? centos, ubuntu or alpine?: "

read baseName

# Checking for wrong base name
if [ ${baseName} != ubuntu ] || [ ${baseName} != centos ] || [ ${baseName} != alpine ]
then
echo "Please enter a valid choice between ubuntu, centos or alpine." #&& cd - && sudo rm -r ${folderName}
fi

echo "What port do you wish to use?: "

read portNumber

echo "What is your preferred ${baseName} version?: "

read baseVersion

# defining condition for each distroType
if [ ${baseName} = ubuntu ]
then
echo -e "FROM ${baseName}:${baseVersion}" "\nLABEL maintainer: ${USER}" "\nEXPOSE ${portNumber}" "\nRUN apt-get update -y" > Dockerfile
echo "Building ${baseName} image."
elif [ ${baseName} = centos ]
then
echo -e "FROM ${baseName}:${baseVersion}" "\nLABEL maintainer: ${USER}" "\nEXPOSE ${portNumber}" "\nRUN yum update -y" > Dockerfile
echo "Building ${baseName} image."
elif [ ${baseName} = alpine ]
then
echo -e "FROM ${baseName}:${baseVersion}" "\nLABEL maintainer: ${USER}" "\nEXPOSE ${portNumber}" "\nRUN apk update" > Dockerfile
echo "Building ${baseName} image."
fi

# build docker image
docker image build -t ${USER}_${baseName} .
if [ $? -eq 0 ]
then
rm -f Dockerfile
cd -
rm -r ${folderName}
echo -e "${baseName} image built successfully and Dockerfile and workspace directory deleted. \n Please run the docker images command to check."
exit 0
fi