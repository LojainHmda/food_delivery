import 'package:flutter/material.dart';

class ProuductDetailsProperty extends StatelessWidget {
  final String title, value;

  const ProuductDetailsProperty(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                const TextStyle(fontWeight: FontWeight.w400, color: Colors.black54)),
        const SizedBox(
          height: 6,
        ),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }
}
