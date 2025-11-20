import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stepindicator extends StatelessWidget {
  final int currentStep;

  Stepindicator({super.key, required this.currentStep});

  Color _getColor(int step){
    return (currentStep>= step) ? Colors.black : Colors.grey;
  }
  FontWeight _getWeight(int step){
    return currentStep == step ? FontWeight.bold : FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.local_shipping_outlined, color: _getColor(1)),
            const SizedBox(height: 4),
            Text(
              "Shipping",
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: _getColor(1),
                fontWeight: _getWeight(1),
              ),
            ),
          ],
        ),

        _divider(),

        Column(
          children: [
            Icon(Icons.payment_outlined, color: _getColor(2)),
            const SizedBox(height: 4),
            Text(
              "Payment",
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: _getColor(2),
                fontWeight: _getWeight(2),
              ),
            ),
          ],
        ),

        _divider(),

        Column(
          children: [
            Icon(Icons.receipt_long_outlined, color: _getColor(3)),
            const SizedBox(height: 4),
            Text(
              "Review",
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: _getColor(3),
                fontWeight: _getWeight(3),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _divider(){
    return Container(
      height: 2,
      width: 50,
      color: Colors.black,
    );
  }
}
