import 'package:flutter/material.dart';

import '../../widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTabletOrDesktop =
        MediaQuery.of(context).size.shortestSide > 600;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login_background.png'),
            ),
          ),
        ),
        Center(
          child: isTabletOrDesktop
              ? LoginCard(height: 600, width: 450)
              : LoginCard(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                ),
        ),
      ],
    );
  }
}
