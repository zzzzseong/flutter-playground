import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {

  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : const Color(0xFF1F2123),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? const Color(0xFF1F2123) : Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                          color: isInverted ? const Color(0xFF1F2123) : Colors.white,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      code,
                      style: TextStyle(
                          color: isInverted ? const Color(0xFF1F2123).withOpacity(0.8) : Colors.white.withOpacity(0.8),
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
                scale: 2.3,
                child: Transform.translate(
                  offset: const Offset(-5, 10),
                  child: Icon(
                      icon,
                      color: isInverted ? const Color(0xFF1F2123) : Colors.white,
                      size: 70
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}