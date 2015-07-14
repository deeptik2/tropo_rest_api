*** Settings ***
Library   HttpLibrary.HTTP




*** Keywords ***


Make Get Tropo App API Call
    [Arguments]      ${resource_url}  ${app_id}
    Create Http Context    ${TROPO_HOST}  ${TRANSPORT_PROTOCOL}
    Set Request Header    Authorization  ${TROPO_BASIC_AUTH}
    GET   ${TROPO_GET_APP_URL}/${APP_ID}
    Response Status Code Should Equal    ${HTTP_CODE_200_OK}
    ${body}=   Get Response Body
    [Return]  ${body}


Verify Json Field And Value
    [Arguments]      ${body}  ${field_name}  ${field_value}
    Json Value Should Equal    ${body}  ${field_name}  ${field_value}



I Have A Resource URL ${GET_APP_URL}
    Set Test Variable    ${GET_APP_URL}

I Have Path Param ${APP_ID}
    Set Test Variable    ${APP_ID}


I Make An API Call
    Create Http Context    ${TROPO_HOST}  ${TRANSPORT_PROTOCOL}
    Set Request Header    Authorization  ${TROPO_BASIC_AUTH}
    GET   ${GET_APP_URL}/${APP_ID}
    Response Status Code Should Equal    ${HTTP_CODE_200_OK}
    ${RESP_STATUS_CODE}=    Get Response Status
    ${RESP_BODY}=   Get Response Body
    Set Test Variable    ${RESP_BODY}
    Set Test Variable    ${RESP_STATUS_CODE}


The Status Code Should Be ${http_code}
    Should Be Equal    ${http_code}  ${RESP_STATUS_CODE}


The Response Body ${body} Should Have Field ${name} And Its Value ${value}
    Json Value Should Equal    ${body}  ${name}  ${value}
