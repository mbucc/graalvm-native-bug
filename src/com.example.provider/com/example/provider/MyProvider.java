package com.example.provider;

import com.example.service.MyService;

public class MyProvider implements MyService {

  @Override
  public void foo() {
    System.out.println("hello from MyProvider");
  }
}
