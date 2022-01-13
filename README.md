To see it work, run `make`.

Verified with graalvm-ce-java17-21.3.0.

Setup:
* use java.util.ServiceLoader
* service in one module
* provider in the other

```
mark@Marks-MBP graalvm-native-service-provider-example % tree src
src
├── com.example.provider
│   ├── com
│   │   └── example
│   │       └── provider
│   │           └── MyProvider.java
│   └── module-info.java
└── com.example.service
    ├── com
    │   └── example
    │       └── service
    │           ├── MyService.java
    │           └── Service.java
    └── module-info.java
```

Expected output:

```
$ make 2>&1 | tail -3
The testapp program should find a provider.
./testapp
Success!
```

The two key commits were:
* https://github.com/mbucc/graalvm-native-service-provider-example/commit/7205c7984039e76701e52c8448c39c3d7f759e04, and
* https://github.com/mbucc/graalvm-native-service-provider-example/commit/3a0e410b80efe13a4926af8223c174a3f7d28701

See https://github.com/oracle/graal/issues/4141 for more details.
