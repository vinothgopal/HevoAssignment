*** Settings ***
Documentation    This suite has hevo pipline testcase
Library   ../Libraries/mysql_helper.py
Resource   ../config.txt
Resource   ../TestData/database_details.txt
Resource   ../Resources/Common_keywords.robot
Resource   ../Resources/hevo_keywords.robot
Suite Teardown    Clean up Hevopipline
*** Variables ***

*** Test Cases ***
Test_1
    [Documentation]   This test create a table in data base ,insert record into da and create a hevo pipline
    create_table_in_mysql    ${table_name}
    insertrecord_into_table    ${table_name}   ${name_record1}   ${age_record1}
    insertrecord_into_table    ${table_name}   ${name_record2}   ${age_record2}
    insertrecord_into_table    ${table_name}   ${name_record3}   ${age_record3}
    fetch_all_details_from_mysql     ${table_name}
    Login into Hevo pipiline
    Configure source
    Select Object in pipeline
    configure destination
    fetch data from destination database
    verify initial data in destination database

Test2
    [Documentation]    This test update the record and verify the value
    update_record_in_mysql    ${table_name}    ${name_record1}    ${updated_name1}
    update_record_in_mysql    ${table_name}    ${name_record2}    ${updated_name2}
    update_record_in_mysql    ${table_name}    ${name_record3}    ${updated_name3}
    fetch data from destination database
    verify updated values in database




*** Keywords ***
Clean up Hevopipline
    Delete hevo pipeline
    Logout Hevo and close the session
    drop_table    ${table_name}



