import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final Widget avatar;

  const ProfileHeader({
    super.key,
    required this.username,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        avatar,
        Flexible(
          child: Text(
            username,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
