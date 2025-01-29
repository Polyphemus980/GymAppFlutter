import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({
    super.key,
    required this.username,
    required this.avatar,
  });
  final String username;
  final Widget avatar;

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
