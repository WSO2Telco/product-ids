#!/bin/bash
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=300'

git clone https://github.com/WSO2Telco/uitest-framework
#change the below virsion if changes are done to mobile-connect-pageobjects
git clone -b ids_2.0.0 https://github.com/WSO2Telco/mobile-connect-pageobjects
#change the below virsion if changes are done to identity-server-pageobjects
git clone -b ids_2.0.0 https://github.com/WSO2Telco/identity-server-pageobjects
git clone https://github.com/WSO2Telco/mobile-connect-tests


cd ./uitest-framework
echo "$PWD"
mvn clean install
echo "~~~"
echo "Building WSO2 Telco uitest-framework Completed"
echo "~~~"
cd ../mobile-connect-pageobjects
echo "$PWD"
mvn clean install
echo "~~~"
echo "Building WSO2 Telco mobile-connect-pageobjects Completed"
echo "~~~"
cd ../identity-server-pageobjects
echo "$PWD"
mvn clean install
echo "~~~"
echo "Building WSO2 Telco identity-server-pageobjects Completed"
echo "~~~"
echo "~~~"
cd ../mobile-connect-tests
echo "$PWD"
echo "~~~"
echo "Please Select Environmnet  "
echo "Production = p"
echo "Qa = q"
read input_variable
echo "You entered: $input_variable"

    case $input_variable in
        [Pp]* )
		echo "Running Test in Production Environmnet" 
		mvn install -Denv=production; 
		break;;
        [Qq]* ) 
		echo "Running Test in QA Environmnet" 
		mvn install -Denv=qa; 
		break;;
        * ) echo "Please answer p or q.";;
    esac

