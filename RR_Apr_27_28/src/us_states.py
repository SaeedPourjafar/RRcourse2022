# Please run the command below in CMD to install the us library
# pip install us

import us
import pickle # Save the list into a pickle
import os # To create directories to write/read files
import pandas as pd # To ask pandas (and NOT polar bears) to create a dataframe for us 

# Creating 'in' directory
filename = "C:/Users/Saeed/Documents/GitHub/RRcourse2022/RR_Apr_27_28/in/states.pkl"
os.makedirs(os.path.dirname(filename), exist_ok=True)

# Reading state names and save them to a list
res = [s.name for s in us.states.STATES]

# Writing the pickled file
with open(filename, 'wb') as f:
    pickle.dump(res, f)

# Reading the pickled file
with open(filename, 'rb') as f:
	states = pickle.load(f)

# Creating the dataframe
States = pd.DataFrame({'UPPER':[s.upper() for s in states],
        'lower':[s.lower() for s in states]})

# Writing the result as a CSV in 'out' folder
States.to_csv('C:/Users/Saeed/Documents/GitHub/RRcourse2022/RR_Apr_27_28/out/States.csv', index = False)