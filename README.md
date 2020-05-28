# ZupTest
Project used for Zup recruitment test

The automated test execution framework was built on top of Python3 + RobotFramework + Pabot + Selenium built using a keyword-driven approach.

The repository is ordered in four main folders:
  1.data: Contains all test data. These files are placed separetely from test scripts because products can become obsolete so they can be change without changes in test script.
  2.driver: Contains the framework test driver script.
  3.requirements: Contains the python requirement file necessary to run the tests.
  4.scripts: Contains test scripts, support files and locators.
  

There are two ways to run the tests:

1. Test Driver
In folder driver, run python3 driver.py

Arguments:
  --include, -i [tags]: Tags of tests to be executed
  
  --exclude, -e [tags]: Tags of tests to be excluded from excution
  
  --browser, -b: Browser to be used for tests (list of supported browsers: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser)
  
  --processes, -p: Number of processes to be run in parallel
  
  --name, -n [tests]: Tests to be executed. When not defined, all tests will be executed according to included/excluded tags
  
  --output, -o: Output directory where reportmlog and evidences will be placed.
  
2. Docker
  Build Dockerfile: docker build . -t zuptest
  
  Run image: docker run --name TestFirefox -v /Users/palarco1/Documents/Pessoal/ZupTest/output:/zupTest/output zuptest -b headlessfirefox
  
  Prefer to add argument -v to share the output with host. By default outputs will be placed in /zupTest/output in container.
  
  After image name, you may use the driver arguments
  
  The Docker image will contain chrome and firefox.
