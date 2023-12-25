import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CloseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        icon: const Icon(Icons.close_rounded),
        color: Theme.of(context).colorScheme.primary,
        onPressed: onPressed);
  }
}
