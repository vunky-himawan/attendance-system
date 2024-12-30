import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/pages/participant/checkout/checkout_page.dart';
import 'package:flutter/material.dart';

Widget detailEventBottomBar(
    BuildContext context, String price, String eventId) {
  return Container(
    width: double.infinity,
    height: 100,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price == "0" ? "Gratis" : 'Rp. ${price.toString()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkBlue,
              padding: const EdgeInsets.fromLTRB(18, 13, 18, 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              elevation: 10,
              shadowColor: darkBlue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    eventId: eventId,
                  ),
                ),
              );
            },
            child: const Text(
              "Beli Sekarang",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
