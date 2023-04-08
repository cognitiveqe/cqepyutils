# from PandasUtils import PandasUtils as cpd
# import pandas as pd
# import time
# start = time.time()
# actual_file_path = r'C://Desktop//Comparison//data//actual//'
# expected_file_path = r'C://Desktop//Comparison//data//baseline//'r'/Users/Vaanisridhar/Downloads/'
# actual_file_name = 'compare_actual_file'
# expected_file_name = 'compare_actual_file'
# file_format = 'psv' or 'csv'
# key_columns = ['Key_Column1', 'Key_Column2']
# ignore_columns = ['Ignore_Column1', 'Ignore_Column2']
# summary_df, summary_key_df, key_mismatche_df, cell_cmp_df = cpd.df_diff(actual_file_path, expected_file_path,
#                                                                         actual_file_name, expected_file_name,
#                                                                         file_format, key_columns, ignore_columns)
# print(str((time.time() - start)))
# summary_df
# summary_key_df
# key_mismatche_df
# cell_cmp_df

# actual_file_path = r'/Users/Vaanisridhar/Downloads/'
# expected_file_path = r'/Users/Vaanisridhar/Downloads/'
# actual_file_name = '1500000 Sales Records'
# expected_file_name = '1500000_Sales_Records_New1'
# file_format = 'csv'
# key_columns = ['Region', 'Country', 'Item Type', 'Sales Channel', 'Order Priority', 'Order Date']
# ignore_columns = []
# summary_df, summary_key_df, key_mismatche_df, cell_cmp_df = cpd.df_diff(actual_file_path, expected_file_path,
#                                                                         actual_file_name, expected_file_name,
#                                                                         file_format, key_columns, ignore_columns)
# print(str((time.time() - start)))

# # Example usage
# import logging.config
#
# # Configure the logger
# logging.config.dictConfig({
#     'version': 1,
#     'handlers': {
#         'console': {
#             'class': 'logging.StreamHandler',
#             'level': 'INFO'
#         }
#     },
#     'root': {
#         'handlers': ['console'],
#         'level': 'INFO'
#     }
# })
#
# # Fetch the query from a file
# file_path = "path/to/query.sql"
# query = fetch_query(file_path)
#
# # Execute the query
# connection_details = "hr/hrpwd@localhost:1521/orclpdb1"
# df = execute_query(query, connection_details)
#
# # Display the query results
# print(df.head())
