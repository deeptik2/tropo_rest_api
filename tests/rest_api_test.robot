*** Settings ***

Resource     ../keywords/rest_api_keywords.robot
Resource     ../keywords/rest_api_variables.robot




*** Test Cases ***


Get Details of The Tropo App
    [Tags]     ATDD
    ${response_body}=    Make Get Tropo App API Call    ${TROPO_GET_APP_URL}  ${APP_ID}
    Verify Json Field And Value    ${response_body}  ${APP_NAME}  ${APP_NAME_VALUE}




#In BDD Format
#
Scenario: Get Details Of The Tropo App
    [Tags]    bdd
    Given I Have A Resource URL ${TROPO_GET_APP_URL}
    And I Have Path Param ${APP_ID}
    When I Make An API Call
    Then The Status Code Should Be ${HTTP_CODE_200_OK}
    And The Response Body ${RESP_BODY} Should Have Field ${APP_NAME} And Its Value ${APP_NAME_VALUE}


