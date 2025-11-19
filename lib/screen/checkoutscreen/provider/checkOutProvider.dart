import 'package:flutter/material.dart';

class CheckoutProvider extends ChangeNotifier {
  // Shipping
  String fullName = "";
  String phone = "";
  String province = "";
  String city = "";
  String street = "";
  String postalCode = "";

  // Payment
  String paymentMethod = "";

  void updateShipping({
    required String fullName,
    required String phone,
    required String province,
    required String city,
    required String street,
    required String postalCode,
  }) {
    this.fullName = fullName;
    this.phone = phone;
    this.province = province;
    this.city = city;
    this.street = street;
    this.postalCode = postalCode;
    notifyListeners();
  }

  void updatePayment(String method) {
    paymentMethod = method;
    notifyListeners();
  }
}