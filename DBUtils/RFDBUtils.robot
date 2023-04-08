*** Settings ***
Library    RFDBUtils.py

*** Variables ***
${query_file_path}    path/to/query_file.sql
${database_config_name}    config_name_here

*** Test Cases ***
Execute SQL Query and Plot Results Test
    ${query}    Get Query From File    ${query_file_path}
    ${dataframe}    Execute Query    ${query}    ${database_config_name}
    Plot Data    ${dataframe}
    ${columns}    Get DataFrame Columns    ${dataframe}
    Should Contain    ${columns}    column_name_here

#*** Settings ***
#Library           logging
#Library           pandas
#Library           sqlalchemy
#Library           base64
#Library           yaml
#Library           matplotlib.pyplot
#Library           IPython.display
#
#*** Variables ***
#${config_file}    config.yaml
#
#*** Keywords ***
#Get Query From File
#    [Arguments]    ${file_path}
#    Log To Console    Step 1: Reading SQL query from file...
#    ${query}=    Get File    ${file_path}
#    [Return]    ${query}
#
#Execute Query
#    [Arguments]    ${query}    ${database_config_name}    ${query_params}=
#    Log To Console    Step 1: Loading database configuration from config file...
#    ${config}=    Get File    ${config_file}
#    ${db_config}=    Set Variable    ${config['database_configurations'][${database_config_name}]}
#    Log To Console    Step 2: Connecting to database using SQLAlchemy...
#    ${password}=    Decode Bytes To String    ${db_config['password']}    base64
#    ${engine}=    Create Engine    oracle://${db_config['username']}:${password}@${db_config['host']}:${db_config['port']}/${db_config['service_name']}
#    Log To Console    Step 3: Executing SQL query...
#    Run Keyword If    ${query_params} is not None    ${result}=    Read SQL Query    ${query}    ${engine}    params=${query_params}
#    ...    ELSE    ${result}=    Read SQL Query    ${query}    ${engine}
#    [Return]    ${result}
#
#Plot Data
#    [Arguments]    ${dataframe}
#    Log To Console    Step 1: Plotting data as graph...
#    ${x_col}, ${y_col}=    Get DataFrame Columns    ${dataframe}
#    Plot    ${dataframe[${x_col}]}    ${dataframe[${y_col}]}    label=Data
#    Set Xlabel    ${x_col}
#    Set Ylabel    ${y_col}
#    Set Title    Query Results
#    Legend
#    Show
#    Log To Console    Step 2: Displaying data as DataFrame...
#    Display DataFrame    ${dataframe}
#
#*** Tasks ***
#Execute Query and Plot Results
#    [Arguments]    ${query_file}    ${database_config_name}
#    ${query}=    Get Query From File    ${query_file}
#    ${result}=    Execute Query    ${query}    ${database_config_name}
#    Plot Data    ${result}
