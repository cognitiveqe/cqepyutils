*** Settings ***
Library  RFPandasUtils.py

*** Test Cases ***
Test Write DataFrame to CSV file
    ${df}=  Create Dataframe  1,2,3\n4,5,6\n7,8,9
    Write DataFrame to CSV file  ${df}  ./  test.csv
    ${written_df}=  Read CSV  ./test.csv
    Should Be True  ${df}.equals(${written_df})

Test Write DataFrame to PSV file
    ${df}=  Create Dataframe  1,2,3\n4,5,6\n7,8,9
    Write DataFrame to PSV file  ${df}  ./  test.psv
    ${written_df}=  Read CSV  ./test.psv  delimiter=|
    Should Be True  ${df}.equals(${written_df})

Test Compare two DataFrames and show differences
    ${actual_file_path}=  Set Variable  ./test_data/
    ${expected_file_path}=  Set Variable  ./baseline_data/
    ${actual_file_name}=  Set Variable  actual_file
    ${expected_file_name}=  Set Variable  expected_file
    ${file_format}=  Set Variable  csv
    ${key_columns}=  Create List  Key_Column1  Key_Column2
    ${ignore_columns}=  Create List  Ignore_Column1  Ignore_Column2
    ${expected_df}=  Read CSV  ${expected_file_path}${expected_file_name}.${file_format}
    ${actual_df}=  Read CSV  ${actual_file_path}${actual_file_name}.${file_format}
    Compare two DataFrames and show differences  ${actual_file_path}  ${expected_file_path}  ${actual_file_name}  ${expected_file_name}  ${file_format}  ${key_columns}  ${ignore_columns}

