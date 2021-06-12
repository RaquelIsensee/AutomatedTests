*** Settings ***
Resource            /home/raquel/AutomatedTests/RobotProject/WebTestDemo/resources/resources.robot
Test Setup          Open site page
Test Teardown       Close site page

*** Test Case ***
Search for product - Blouse
    Access home page
    Search for "Blouse" on search element
    Validate search for "Blouse"

Search for product - Non existent product
    Access home page
    Search for "NON-EXISTENT" on search element
    Validate error message "No results were found for your search "NON-EXISTENT""