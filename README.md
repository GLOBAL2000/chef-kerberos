Simple kerberos chef recipe
===========================

This will be extended over time to support more options.

Usage example (client)
----------------------

```ruby
default_attributes "kerberos" => {
    "realms" => {
        "MYREALM.COM" => {
            "kdc" => ["kerberos1.myrealm.com", "kerberos2.myrealm.com"],
            "admin_server" => ["kerberos2.myrealm.com"]
        }
        "MYREALM2.COM" => {
            "kdc" => ["kerberos1.myrealm2.com", "kerberos2.myrealm2.com"],
            "admin_server" => ["kerberos2.myrealm2.com"]
        }
    },
    "default_realm" => "MYREALM.COM",
    "pam" => true,
    "machine_admins" => ["jimdoe/admin"]
}
```

Usage example (server)
----------------------

```ruby
default_attributes "kerberos" => {
    "default_realm" => "MYREALM.COM",
    "kerberos_admins" => ["janedoe/admin", "johndoe/admin"],
}
```
