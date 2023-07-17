import 'package:flutter/material.dart';

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
                          Text(
                            "Компания",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Omega Studio",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Работа в Omega Studio",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 70),
                          Text(
                            "Разработчикам",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Справка",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: constraints.maxWidth / 20),
                      // Second column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Пользователям",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Пользовательское \nсоглашение",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white, height: 1.5),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Политика \nконфиденциальности",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white, height: 1.5),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Политика использования \nфайлов cookie",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white, height: 1.5),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Справка",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
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
                                Text(
                                  "Бизнесу",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Контакты",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Новости",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Справка",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.white),
                                ),
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
                                Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(9),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child:
                                      Image.asset('assets/images/vk_black.png'),
                                ),
                                Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(9),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child:
                                      Image.asset('assets/images/telegram.png'),
                                ),
                                Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.all(9),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child:
                                      Image.asset('assets/images/you_tube.png'),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            // Simple line
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
