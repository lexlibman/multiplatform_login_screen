import 'package:flutter/material.dart';
import 'package:multiplatform_login_screen/ui/screens/login_screen/web_layout/widgets/footer/footer_widgets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      color: Theme.of(context).colorScheme.onBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 80,
          horizontal:
              constraints.maxWidth > 610 ? constraints.maxWidth / 10 : 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: constraints.maxWidth > 1400 ? 4 : 3,
                  // Info Links
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // First column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FooterHeadline(title: "Компания"),
                          const SizedBox(height: 15),
                          FooterLink(
                            title: "Omega Studio",
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          FooterLink(
                            title: "Работа в Omega Studio",
                            onTap: () {},
                          ),
                          const SizedBox(height: 70),
                          const FooterHeadline(title: "Разработчикам"),
                          const SizedBox(height: 15),
                          FooterLink(
                            title: "Справка",
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(width: constraints.maxWidth / 20),
                      // Second column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FooterHeadline(title: "Пользователям"),
                          const SizedBox(height: 15),
                          FooterLink(
                            title: "Пользовательское \nсоглашение",
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          FooterLink(
                            title: "Политика \nконфиденциальности",
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          FooterLink(
                            title: "Политика использования \nфайлов cookie",
                            onTap: () {},
                          ),
                          const SizedBox(height: 10),
                          FooterLink(
                            title: "Справка",
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(width: constraints.maxWidth / 20),
                      // Third column
                      constraints.maxWidth > 495
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FooterHeadline(title: "Бизнесу"),
                                const SizedBox(height: 15),
                                FooterLink(title: "Контакты", onTap: () {}),
                                const SizedBox(height: 10),
                                FooterLink(title: "Новости", onTap: () {}),
                                const SizedBox(height: 10),
                                FooterLink(title: "Справка", onTap: () {}),
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                // Download app button and social links
                constraints.maxWidth > 1100
                    ? Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.file_download_outlined),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Скачать приложение",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Социальные \nсети:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                ),
                                const SocialLinkIcon(
                                    imageAsset: 'assets/images/vk_black.png'),
                                const SocialLinkIcon(
                                    imageAsset: 'assets/images/telegram.png'),
                                const SocialLinkIcon(
                                    imageAsset: 'assets/images/you_tube.png'),
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            // Just a line
            Container(
              height: 1,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            // Legal info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "© 2023 ООО «ОМЕГА СТУДИО»\nИНН: 3528327105, ОГРН: 1213500003122\n162608, Вологодская область, г. Череповец, ул Белинского, д. 1/3",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                constraints.maxWidth > 780
                    ? Image.asset(
                        'assets/images/footer_logo.png',
                        height: 80,
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
