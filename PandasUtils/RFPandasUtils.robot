*** Settings ***
Library  RFPandasUtils.py

*** Test Cases ***
#Test Write DataFrame to CSV file
#    ${df}=  Create Dataframe  1,2,3\n4,5,6\n7,8,9
#    Write DataFrame to CSV file  ${df}  ./  test.csv
#    ${written_df}=  Read CSV  ./test.csv
#    Should Be True  ${df}.equals(${written_df})
#
#Test Write DataFrame to PSV file
#    ${df}=  Create Dataframe  1,2,3\n4,5,6\n7,8,9
#    Write DataFrame to PSV file  ${df}  ./  test.psv
#    ${written_df}=  Read CSV  ./test.psv  delimiter=|
#    Should Be True  ${df}.equals(${written_df})
#
#Test Compare two DataFrames and show differences
#    ${actual_file_path}=  Set Variable  ./test_data/
#    ${expected_file_path}=  Set Variable  ./baseline_data/
#    ${actual_file_name}=  Set Variable  actual_file
#    ${expected_file_name}=  Set Variable  expected_file
#    ${file_format}=  Set Variable  csv
#    ${key_columns}=  Create List  Key_Column1  Key_Column2
#    ${ignore_columns}=  Create List  Ignore_Column1  Ignore_Column2
#    ${expected_df}=  Read CSV  ${expected_file_path}${expected_file_name}.${file_format}
#    ${actual_df}=  Read CSV  ${actual_file_path}${actual_file_name}.${file_format}
#    Compare two DataFrames and show differences  ${actual_file_path}  ${expected_file_path}  ${actual_file_name}  ${expected_file_name}  ${file_format}  ${key_columns}  ${ignore_columns}
#
#*** Test Cases ***
#Read CSV file
#    [Documentation]    Read data from a CSV file
#    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records.csv
#    Log    ${dataframe}
#
#Read PSV file
#    [Documentation]    Read data from a PSV file
#    ${dataframe}=    Create Dataframe from file    ../tests/10000 Sales Records.psv    delimiter='|'
#    Log    ${dataframe}
##10000 Sales Records
#Read Excel file
#    [Documentation]    Read data from an Excel file
#    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records.xlsx
#    Log    ${dataframe}

#*** Test Cases ***
Read CSV file with header
    [Documentation]    Read data from a CSV file with header
    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records.csv
    Log    ${dataframe}

Read CSV file without header
    [Documentation]    Read data from a CSV file without header
    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records_without_header.csv    has_header=False
    Log    ${dataframe}

Read Excel file with header
    [Documentation]    Read data from an Excel file with header
    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records.xlsx
    Log    ${dataframe}


Read Excel file without header
    [Documentation]    Read data from an Excel file without header
    ${dataframe}=    Create Dataframe from file    ../tests/5m Sales Records_without_header.xlsx    has_header=False
    Log    ${dataframe}

Read PSV file with header
    [Documentation]    Read data from a PSV file with header
    ${dataframe}=    Create Dataframe from file    ../tests/10000 Sales Records.psv    delimiter='|'
    Log    ${dataframe}

Read PSV file without header
    [Documentation]    Read data from a PSV file without header
    ${dataframe}=    Create Dataframe from file    ../tests/10000 Sales Records_without_header.psv    delimiter='|'    has_header=False
    Log    ${dataframe}

#*** Settings ***
#Library           OperatingSystem
#Library           Pandas
#Library           Difflib
#Library           Collections
#
#*** Keywords ***
#Files Diff
#    [Arguments]     ${src_dir}     ${tgt_dir}
#    Log To Console  Step 1: Log the comparison directories
#    Log To Console  Comparing files in ${src_dir} and ${tgt_dir}
#
#    ${common_files}    Create List
#    ${match}    Create List
#    ${mismatch}    Create List
#    ${errors}    Create List
#
#    Log To Console  Step 2: Find common files in source and target directories
#    :FOR    ${file}    IN    @{os.listdir}(${src_dir})
#    \    Run Keyword If    '${file}' in @{os.listdir}(${tgt_dir})    Append To List    ${common_files}    ${file}
#
#    Log To Console  Step 3: Compare each common file
#    :FOR    ${file}    IN    @{common_files}
#    \    ${src_path}    Join Path    ${src_dir}    ${file}
#    \    ${tgt_path}    Join Path    ${tgt_dir}    ${file}
#
#    \    ${src_size}    Get File Size    ${src_path}
#    \    ${tgt_size}    Get File Size    ${tgt_path}
#
#    \    ${cmp_result}    Compare Files    ${src_path}    ${tgt_path}
#    \    Run Keyword If    '${cmp_result}' == 'True'    Append To List    ${match}    ${file}    ${src_size}    ${tgt_size}
#    \    ...    ELSE    Compare File Contents    ${src_path}    ${tgt_path}    ${mismatch}    ${file}    ${src_size}    ${tgt_size}
#
#    Log To Console  Step 7: Find files that only exist in the source directory
#    :FOR    ${file}    IN    @{os.listdir}(${src_dir})
#    \    Run Keyword If    '${file}' not in @{common_files}    Append To List    ${only_in_src}    ${file}    Get File Size    ${src_dir}${/}${file}
#
#    Log To Console  Step 8: Find files that only exist in the target directory
#    :FOR    ${file}    IN    @{os.listdir}(${tgt_dir})
#    \    Run Keyword If    '${file}' not in @{common_files}    Append To List    ${only_in_tgt}    ${file}    Get File Size    ${tgt_dir}${/}${file}
#
#    Log To Console  Step 9: Create a list of DataFrames to concatenate
#    :FOR    ${file}    ${src_size}    ${tgt_size}    ${diff_percentage}    IN    @{mismatch}
#    \    ${comments}    Set Variable If    ${diff_percentage} > 0    Contents differ (diff % = ${diff_percentage})    ''
#    \    ${df}    Create Dataframe    File=${file}    Status=Mismatch    Comments=${comments}    Size (Source)=${src_size}    Size (Target)=${tgt_size}
#    \    Append To List    ${df_list}    ${df}
#
#    :FOR    ${file}    ${src_size}    ${tgt_size}    IN    @{match}
#    \    ${df}    Create Dataframe    File=${file}    Status=Match    Comments=''    Size (Source)=${src_size}    Size (Target)=${tgt_size}
#    \    Append To List    ${df_list}    ${df}




#*** Variables ***
#${file_path}       ${CURDIR}/test_data/sample.csv
#${delimiter}       ,
#${has_header}      True
#${skiprows}        None
#${skipfooter}      None
#${expected_df}     | col1 | col2 | col3 |
#                   |------|------|------|
#                   | 1    | 2    | 3    |
#                   | 4    | 5    | 6    |
#                   | 7    | 8    | 9    |
#
#*** Keywords ***
#Given
#    [Arguments]  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    Set Test Variable  ${file_path}  ${file_path}
#    Set Test Variable  ${delimiter}  ${delimiter}
#    Set Test Variable  ${has_header}  ${has_header}
#    Set Test Variable  ${skiprows}  ${skiprows}
#    Set Test Variable  ${skipfooter}  ${skipfooter}
#
#
#
#*** Test Cases ***
#Create DataFrame from CSV with Header
#    [Documentation]  Creates a Pandas DataFrame from a CSV file with header.
#    Given  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    ${df}  Create DataFrame from file  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    Should be true  ${df.isna().sum().sum() == 0}
#    Should be equal as dataframes  ${df}  ${expected_df}
#
#Create DataFrame from CSV without Header
#    [Documentation]  Creates a Pandas DataFrame from a CSV file without header.
#    Given  ${file_path}  ${delimiter}  ${has_header}=False  ${skiprows}  ${skipfooter}
#    ${df}  Create DataFrame from file  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    Should be true  ${df.isna().sum().sum() == 0}
#    Should be equal as dataframes  ${df}  ${expected_df}
#
#Create DataFrame from Excel with Header
#    [Documentation]  Creates a Pandas DataFrame from an Excel file with header.
#    Given  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    ${df}  Create DataFrame from file  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    Should be true  ${df.isna().sum().sum() == 0}
#    Should be equal as dataframes  ${df}  ${expected_df}
#
#Create DataFrame from Excel without Header
#    [Documentation]  Creates a Pandas DataFrame from an Excel file without header.
#    Given  ${file_path}  ${delimiter}  ${has_header}=False  ${skiprows}  ${skipfooter}
#    ${df}  Create DataFrame from file  ${file_path}  ${delimiter}  ${has_header}  ${skiprows}  ${skipfooter}
#    Should be true  ${df.isna().sum().sum() == 0}
#    Should be equal as dataframes  ${df}  ${expected_df}
#
