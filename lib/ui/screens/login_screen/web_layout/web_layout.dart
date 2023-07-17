import 'package:flutter/material.dart';
import 'package:multiplatform_login_screen/ui/screens/login_screen/web_layout/widgets/footer/footer.dart';

import '../../../widgets/login_card.dart';
import 'widgets/header/header.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: Header(constraints: constraints),
        body: ListView(children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  height: 880,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/login_background.png'),
                    ),
                  ),
                ),
                constraints.maxWidth > 600
                    ? Positioned(
                        left: constraints.maxWidth / 15,
                        top: constraints.maxHeight / 10,
                        child: const LoginCard(
                          height: 550,
                          width: 450,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.only(top: 80),
                        child: Center(
                          child: LoginCard(
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.width / 1.1,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          constraints.maxWidth > 450
              ? Footer(constraints: constraints)
              : const SizedBox(),
        ]),
      );
    });
  }
}
