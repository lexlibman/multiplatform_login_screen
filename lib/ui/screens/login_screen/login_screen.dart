import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_login_screen/ui/screens/login_screen/web_layout/web_layout.dart';

import '../../widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isBigScreen = MediaQuery.of(context).size.shortestSide > 600;
    if (kIsWeb) {
      return const WebLayout();
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/login_background.png'),
        ),
      ),
      child: Center(
        child: isBigScreen
            ? const LoginCard(height: 600, width: 450)
            : LoginCard(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.1,
              ),
      ),
    );
  }
}
