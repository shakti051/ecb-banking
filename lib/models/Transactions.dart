import 'package:flutter/material.dart';

class Transaction {
  final primary;
  final seconday;
  final bool type;
  final amount;
  final icon;
  final background;
  final width;

  Transaction(
      {this.primary,
      this.seconday,
      this.type,
      this.amount,
      this.icon,
      this.background,
      this.width});
}

List<Transaction> transactions = [
  Transaction(
      icon: 'https://picsum.photos/100',
      primary: "Dribble Inc",
      seconday: "Payment",
      type: false,
      amount: 45,
      background: Color(0xffFFE9EF),
      width: 28),
  Transaction(
      icon: 'https://picsum.photos/100',
      primary: "Spotify Family",
      seconday: "Payment",
      type: true,
      amount: 163,
      background: Color(0xffE2FBED),
      width: 28),
  Transaction(
      icon: 'https://picsum.photos/100',
      primary: "Netflix",
      seconday: "Payment",
      type: false,
      amount: 15,
      background: Color(0xffE9E9E9),
      width: 15),
  Transaction(
      icon: 'https://picsum.photos/100',
      primary: "Uber",
      seconday: "Payment",
      type: false,
      amount: 35,
      background: Color(0xffE9E9E9),
      width: 27),
];
