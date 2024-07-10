import 'package:flutter/material.dart';

import '../../data/model/ingrident.dart';

class IngridentItemWidget extends StatelessWidget {
  final Ingrident ingrident;

  const IngridentItemWidget({
    super.key,
    required this.ingrident,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              ingrident.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ingrident.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '${ingrident.weight}g',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
