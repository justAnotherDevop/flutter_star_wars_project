import 'package:flutter/material.dart';

class MovieDetailRow extends StatelessWidget {
  final String title;
  final int itemCount;
  final double rowHeight;
  final Widget Function(BuildContext, int) itemBuilder;

  const MovieDetailRow({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    this.rowHeight = 150.0
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: rowHeight,
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