import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.end,
      ),
    );
  }
}
