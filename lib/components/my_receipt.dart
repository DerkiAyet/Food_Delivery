import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp/models/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ Success icon
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA), // light cyan background
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.check_circle,
                color: Color(0xFF00ACC1), // cyan primary color
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            // 🧾 Title
            const Text(
              "Thank you for your order!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238), // dark grey
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            // 🧾 Subtitle
            const Text(
              "Your receipt is shown below.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF607D8B), // grey-blue
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // 🧾 Receipt card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF), // white card
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.displayCartReceipt(),
                  style: const TextStyle(
                    fontFamily: "monospace",
                    fontSize: 14,
                    color: Color(0xFF37474F), // dark grey
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ⏰ Estimated delivery
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.access_time, color: Color(0xFF00ACC1)),
                SizedBox(width: 8),
                Text(
                  "Estimated delivery: 4:10 PM",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF455A64), // medium grey
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ✅ Back home button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home_outlined),
                label: const Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00ACC1), // cyan
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
