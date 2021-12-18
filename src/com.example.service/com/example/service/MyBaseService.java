package com.example.service;


public abstract class MyBaseService implements MyService {

  public abstract void bar();

  @Override
  public void foo() {
    bar();
  }
}
