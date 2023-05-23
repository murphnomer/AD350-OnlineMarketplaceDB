# Requires libraries "names" and "random-text" from pip

import names
from randomText import RandomTextClient

client = RandomTextClient(api_key='3230716e3b4a429eba9d56a0d1140ba8')

user_count : int = 35

users = []
emails = client.internet_stuff.get_random(size=user_count)
addresses = client.address.get_random(size=user_count)

for i in range(user_count):
    line = "    ('" + names.get_first_name() + "', '" + names.get_last_name() + "', '" + emails.loc[i,'username'] + "@" + emails.loc[i,'domain_name'] + "', '" + addresses.loc[i,'street_address'] + "', '" +  addresses.loc[i,'state_abbr'] + "', '" +  addresses.loc[i,'zip_code'] + "', '" +  addresses.loc[i,'city'] +  "', 'USA'),"
    print(line)
