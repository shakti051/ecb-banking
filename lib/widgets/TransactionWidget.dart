import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "../models/Transactions.dart";

class Transactionwidget extends StatelessWidget {
  final Transaction transaction;
  Transactionwidget({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xffF1F3F6), width: 1),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                color: transaction.background,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Image.network(
                transaction.icon,
                width: transaction.width.toDouble(),
              ),
            ),
          ),
          SizedBox(
            width: 19,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.primary,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Color(0xff424242),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                transaction.seconday,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xff424242),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Spacer(),
          transaction.type
              ? Text(
                  "+ ${transaction.amount}",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff45C232)),
                )
              : Text(
                  "- ${transaction.amount}",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffF14E4E),
                  ),
                )
        ],
      ),
    );
  }
}
