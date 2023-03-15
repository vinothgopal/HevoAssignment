*** Settings ***
Library   SeleniumLibrary
Resource   ../config.txt
Resource   pom/home_obj.robot
Resource   ../TestData/hevo_data.txt
Resource   ../TestData/database_details.txt
Library    ../Libraries/common_helper.py

*** Variables ***


*** Keywords ***
Configure source
    click element    ${pipline_menu}
    click element   ${create_pipeline}
    input text    ${search_source}   ${suorce_database_name}
    click element    ${click_mysql}
    Enter source database details
    page should contain    ${object_screen}


Enter source database details
    input text    ${source_host_locator}    ${source_public_ip}
    input text    ${source_port_locator}    ${souce_public_port}
    input text    ${source_admin_user_locator}    ${source_user}
    input text    ${source_admin_pass_locator}    ${source_password}
    scroll element into view     ${select_more}
    Execute Javascript    document.evaluate("${select_more}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #click element    ${select_more}
    #click element     ${table_radio_locator}
    Execute Javascript    document.evaluate("${table_radio_locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    scroll element into view    ${source_database_locator}
    input text    ${source_database_locator}    ${source_database}
    click element    ${test_and_continue_locator}


Select Object in pipeline
    click element    ${continue_object}
    click element    ${timestamp_column}
    click element    ${lastmodified}
    click element    ${contains_continue}
    page should contain    ${destination_page}

configure destination
    input text    ${dest_search}    ${destination_database_name}
    click element    ${select_dest_db}
    input text    ${prefix_locator}    ${prefix}
    click element    ${json_continue}
    sleep   15s
    page should contain    ${finalscreen}

fetch data from destination database
    click element   ${destination_menu}
    click element    ${open_destination_setup}
    click element    ${workbenach_locator}
    click element    ${pre_elem}
    sleep  5s
    press keys   ${pre_elem}    select * from `${destination_database}`.`vinothgopal_hevodata_${table_name}`
    click element    ${runquery}
    sleep  5s
    capture page screenshot

verify initial data in destination database
    page should contain    ${name_record1}
    page should contain    ${name_record2}
    page should contain    ${name_record3}
    page should contain    ${age_record1}
    page should contain    ${age_record2}
    page should contain    ${age_record3}

Delete hevo pipeline
    click element     ${pipline_menu}
    click element    ${expand_arrow}
    click element    ${thredot_locator}
    click element    ${delete_pipeline}
    click element    ${confirm_delete}

verify updated values in database
    page should contain    ${updated_name1}
    page should contain    ${updated_name2}
    page should contain    ${updated_name3}
    page should contain    ${age_record1}
    page should contain    ${age_record2}
    page should contain    ${age_record3}
