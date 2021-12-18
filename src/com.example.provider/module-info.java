module com.example.provider {
  requires com.example.service;
  provides com.example.service.MyService
    with com.example.provider.MyProvider;
}
