@echo off

git clone https://github.com/WSO2Telco/uitest-framework
git clone -b ids_2.0.0 https://github.com/WSO2Telco/mobile-connect-pageobjects 
git clone -b ids_2.0.0 https://github.com/WSO2Telco/identity-server-pageobjects
git clone https://github.com/WSO2Telco/mobile-connect-tests


cd ./uitest-framework
echo "%cd%"
call mvn clean install
echo "-------------------------------"
echo "Building WSO2 Telco uitest-framework Completed"
echo "-------------------------------"
cd ../mobile-connect-pageobjects
echo "%cd%"
call mvn clean install
echo "-------------------------------"
echo "Building WSO2 Telco mobile-connect-pageobjects Completed"
echo "-------------------------------"
cd ../identity-server-pageobjects
echo "%cd%"
call mvn clean install
echo "-------------------------------"
echo "Building WSO2 Telco identity-server-pageobjects Completed"
echo "-------------------------------"
echo "-------------------------------"
cd ../mobile-connect-tests
echo "%cd%"

echo "-------------------------------"
echo "Please Select Environmnet  "
echo "Production = p"
echo "Qa = q"

set /p k="Please enter Choice : "

if "%k%" == "q" goto qa
if "%k%" == "p" goto prod


:prod
	echo "--------Running Test in Production Environmnet-------------" 
	call mvn install -Denv=production;
:qa
	echo "--------Running Test in QA Environmnet---------------"
	call mvn install -Denv=qa;
