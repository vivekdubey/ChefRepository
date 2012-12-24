Description
===========

Requirements
============

Attributes
==========

Usage
=====

Note
=====
Steps for creating encryptes  data bags:

1) openssl rand -base64 512 | tr -d '\r\n' > /etc/chef/encrypted_data_bag_secret  # this generates secret key file in the given location
2) knife data bag create --secret-file /etc/chef/encrypted_data_bag_secret  passwords mongodb   # creates data bag "passwords" with entry for mongodb
3) It opens a window where you can put values for various keys, example: 
    {
        "id": "mongodb",
        "user": "admin",
        "password": "password"

    }
