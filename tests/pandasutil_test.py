# from PandasUtils import PandasUtils as cpd
# import pandas as pd
# import time
# start = time.time()
# # print(str(time.time()))
# df5 = pd.read_csv('Path/450000_Sales_Records.csv', dtype='str')
# keys = ['Region', 'Country', 'Item_Type', 'Sales_Channel', 'Order_Priority', 'Order_Date']
# df5.set_index(keys, drop=True, append=False, inplace=True, verify_integrity=True)
#
# df6 = pd.read_csv('Path/450000_Sales_Records_1.csv', dtype='str')
# df6.set_index(keys, drop=True, append=False, inplace=True, verify_integrity=True)
#
# df_final = cpd.df_diff(df5, df6, keys)
# # print(len(df_final))
# # print(df_final.head())
# df_final.to_csv('Path/comparison_results.csv')
# # print(str(time.time()))
# print(str((time.time() - start)))
