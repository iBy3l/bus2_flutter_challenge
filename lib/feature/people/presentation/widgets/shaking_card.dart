import 'dart:math';

import 'package:flutter/material.dart';

class ShakingCard extends StatefulWidget {
  const ShakingCard({super.key});

  @override
  State<ShakingCard> createState() => _ShakingCardState();
}

class _ShakingCardState extends State<ShakingCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset = sin(_controller.value * 2 * pi) * 2;
        return Transform.translate(offset: Offset(offset, 0), child: child);
      },
      child: const Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey),
          title: ContainerWidget(width: 100, height: 16),
          subtitle: ContainerWidget(width: 150, height: 12),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  const ContainerWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, color: Colors.grey.shade300);
  }
}
