package com.example.service;

import java.util.ServiceLoader;

public class Service {

  public static void main(String[] args) {
    int servicesFound = 0;
    var xs = ServiceLoader.load(MyService.class);
    for (MyService x : xs) {
      servicesFound++;
    }
    if (servicesFound == 0) {
      System.err.println("no providers found");
      System.exit(1);
    }
  }
}
