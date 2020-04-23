# from PandasUtils import PandasUtils as cpd
# import pandas as pd
# import time
# start = time.time()
# actual_file_path = r'C://Desktop//Comparison//data//actual//'
# expected_file_path = r'C://Desktop//Comparison//data//baseline//'
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