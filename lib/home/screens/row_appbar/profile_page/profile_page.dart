import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(providerConfigs: [
      EmailProviderConfiguration(),
    ], avatarSize: 24);
  }
}
