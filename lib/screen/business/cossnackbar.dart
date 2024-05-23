import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, IconData icon, String firstText) {
  String secondText = firstText.isEmpty ? 'Warning' : 'Warning';

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 102),
      backgroundColor: const Color.fromARGB(255, 250, 192, 46),
      content: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 15),
                child: Text(
                  secondText,
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                icon,
                color: const Color.fromARGB(255, 250, 192, 46),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Text(
                  firstText,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
