import 'package:flutter/material.dart';

class MapIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  static const size = 35.0;

  const MapIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 3, color: Theme.of(context).primaryColor),
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(size),
              onTap: onPressed,
              child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Icon(icon,
                      size: 30, color: Theme.of(context).colorScheme.primary)),
            )));
  }
}
