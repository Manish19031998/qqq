#!/bin/bash

set -eu


echo "It is manish location /home/manish/data"
echo "now write your location" 
echo "your current path is  $(pwd)"
read -p "write your location - " a

mkdir -p $a

podman run -dt --name openldap-container -p 3389:3389 -v $a:/data -e DS_SUFFIX=dc=finoptaplus,dc=com -e DS_DM_PASSWORD=1 quay.io/389ds/dirsrv

podman exec -it openldap-container dsconf -D "cn=Directory Manager" ldap://localhost:3389 backend suffix list


podman exec -it openldap-container dsconf -D "cn=Directory Manager" ldap://localhost:3389 backend create --suffix "dc=finoptaplus,dc=com" --be-name "finoptaplus"







ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 1_Add_Directory.ldif

ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 2_Add_common_attribues.ldif

ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 3_Add_object_class.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 4_error_Code.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 5_add_account.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 6_add_bussiness_type_code.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 7_add_master_for_error_hold_restrictions.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 8_add_partners.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 9_status.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 10_Add_Business_types.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 11_Add_Merchants.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 12_Add_prapluserror_code.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 13_Add_transaction_Groups_And_Transaction_Types.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 14_Add_banks.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 15_Add_glsfinal.ldif
ldapadd -a -c -x -H ldap://localhost:3389 -D "cn=Directory Manager" -W -f 16_Add_status.ldif

