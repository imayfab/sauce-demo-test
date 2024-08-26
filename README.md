# Test Run Instruction

## Pre-requisites
### The following software should be installed:
* python >= 3.10.12
* pip >= 22.0.2
* Pycharm IDE or VS Code Editor
* Python installation for [Ubuntu](https://phoenixnap.com/kb/how-to-install-python-3-ubuntu)
* Python installation for [Windows](https://phoenixnap.com/kb/how-to-install-python-3-windows)
>Installing the latest python version will automatically install pip package manager

## Project structure
* **Resource** - all reusable keywords that are being used in the Test are placed here as .robot file
* **Test** - all test cases are placed here as .robot file
* **requirements.txt** - contains the python modules/libraries that are being used in the project (e.g. robotframework, robotframework-seleniumlibrary)
* **runTest.sh** - bash script that contains commands in running the test for Ubuntu OS.
* **runTest.bat** - batch script that contains commands in running the test for Windows OS.

## Installing the packages
Go to the project root directory and execute the command below:
```commandline
pip install -r requirements.txt
```

## Running the test
Clone the repository by running the command:
```commandline
git clone https://github.com/imayfab/sauce-demo-test.git
```
### Running via VS Code or Pycharm Integrated Terminal
* Open the project using the IDE of your choice.
* Open the integrated terminal of the IDE.
* Execute command below:
> ***For Windows:***
> ``` robot --outputdir Results Test\ProductPurchaseTest.robot```

> ***For Linux based OS:***
> ```robot --outputdir Results Test/ProductPurchaseTest.robot```

### Running via bash script (Ubuntu/Linux)
Go to the project root directory and execute the command below:
```
./runTest.sh
```

### Running via batch script (Windows)
Go to the project root directory and execute the command below:
```
runTest.bat
```

## Reporting
After the test execution, ***Results*** folder will be generated that contains
HTML and XML files for detailed logs and report (log.html, report.html, screenshots for failures).