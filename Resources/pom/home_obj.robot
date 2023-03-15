*** Variables ***
#Delete the pipline
${thredot_locator}   //span[text()=' Active ']/../../following::div[1]/button
${delete_pipeline}   //*[contains(text(),' Delete')]
${confirm_delete}    //*[contains(text(),' DELETE this Pipeline')]
${expand_arrow}    //span[text()=' Active ']/../../following::hd-icon[1]
#create pipeline

${pipline_menu}    //span[text()='Pipelines']

${create_pipeline}   //*[text()=' Create Pipeline ']

${search_source}    //input[@placeholder='Search Source Types']
${click_mysql}    //div[text()=' MySQL ']

${source_host_locator}    //input[@name='db-host']
${source_port_locator}   //input[@name='db-port']
${source_admin_user_locator}   //input[@name='db-admin']
${source_admin_pass_locator}    //input[@name='db-password']
${select_more}    //div[text()='Select an Ingestion Mode']/following::button[1]
${table_radio_locator}   //input[@value='table']/..
${source_database_locator}   //input[@name='db-name']
${test_and_continue_locator}   //button[text()=' Test & Continue ']

#select object
${continue_object}    //button[text()='Continue']
${timestamp_column}   //input[@placeholder='Timestamp Column']
${lastmodified}    //span[text()='last_modified']
${contains_continue}    //button[contains(text(),'Continue')]
#select destination
${dest_search}    //input[@class='search-box']
${select_dest_db}    //div[contains(text(),' MySQL Destination ')]
${json_continue}    //button[@class='submit-btn btn btn-primary']
${prefix_locator}    //input[@name='destination-prefix']

${runnow}    //*[text()=' Run Now ']

#verify destination
${destination_menu}    //span[text()='Destinations']
${open_destination_setup}    //div[contains(text(),' MySQL Destination ')]/following::div[1][contains(text(),'MySQL')]
${workbenach_locator}    //a[@routerlink="./workbench"]
${runquery}    //button[contains(text(),' Run Query ')]
${pre_elem}    //pre[@class=' CodeMirror-line ']
