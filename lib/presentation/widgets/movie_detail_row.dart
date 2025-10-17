import 'package:flutter/material.dart';

class MovieDetailRow extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const MovieDetailRow({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}