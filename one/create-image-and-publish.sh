#!/bin/bash
script="create-image-and-publish"

#Declare the number of mandatory args
margs=0

# Common functions

function help {
  usage
    echo -e "OPTIONAL:"
    echo -e "  -v, --version  VAL:  The container version number \n"
  example
}

function example {
    echo -e "Example:\n$script -v VAL"
}

function usage {
    echo -e "Usage: $script MANDATORY [OPTIONAL]\n"
}

# Ensures that the number of passed args are at least equals to the declared number of mandatory args.
# It also handles the special case of the -h or --help arg.
function margs_precheck {
	if [ $2 ] && [ $1 -lt $margs ]; then
		if [ $2 == "--help" ] || [ $2 == "-h" ]; then
			help
			exit
		else
	    	usage
			example
	    	exit 1 # error
		fi
	fi
}

# Ensures that all the mandatory args are not empty
function margs_check {
	if [ $# -lt $margs ]; then
	    usage
	  	example
	    exit 1 # error
	fi
}

# Main
PROJECT_VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression='project.version' -q -DforceStdout)
PROJECT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression='project.artifactId' -q -DforceStdout)
CONTAINER_VERSION="$PROJECT_VERSION"

## Args WHILE loop
while [ "$1" != "" ]; do
  case $1 in
    -v | --version )
      shift
      CONTAINER_VERSION=$1
      ;;
    -h | --help )
      help
      exec "$SHELL"
      exit
      ;;
    * )
      echo "ERROR: unknown parameter \"$1\", use --help or -h for more information on how to use this script."  
      exec "$SHELL"
      exit 1
  esac
  shift
done


echo --- CREATING DOCKER IMAGE AND PUBLISHING TO DOCKER HUB... ---
mvn -N io.takari:maven:wrapper
./mvnw spring-boot:build-image
docker tag "$PROJECT_ID":"$PROJECT_VERSION" h3ar7b3a7/"$PROJECT_ID":"$CONTAINER_VERSION"
docker push h3ar7b3a7/"$PROJECT_ID":"$CONTAINER_VERSION"
docker tag "$PROJECT_ID":"$PROJECT_VERSION" h3ar7b3a7/"$PROJECT_ID":latest
docker push h3ar7b3a7/"$PROJECT_ID":latest
echo --- DONE! ---
exec "$SHELL"