import 'package:flutter/material.dart';
import 'package:multiplatform_login_screen/ui/screens/login_screen/web_layout/widgets/header/header_item_button.dart';
import 'package:multiplatform_login_screen/ui/widgets/custom_text_field.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  Header({super.key, required this.constraints});

  final BoxConstraints constraints;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: constraints.maxWidth / 15,
        vertical: 10,
      ),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            constraints.maxWidth > 600
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Для вас",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Для бизнеса",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Для разработчиков",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 10,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                constraints.maxWidth > 910
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ItemButton(title: "Игры"),
                          SizedBox(width: 25),
                          ItemButton(title: "Приложения"),
                          SizedBox(width: 25),
                          ItemButton(title: "Сообщество"),
                          SizedBox(width: 25),
                          ItemButton(title: "Турнир"),
                          SizedBox(width: 25),
                          ItemButton(title: "Справка"),
                        ],
                      )
                    : const SizedBox(),
                constraints.maxWidth > 1300
                    ? SizedBox(
                        width: 315,
                        height: 40,
                        child: CustomTextField(
                          label: "Поиск",
                          isObscure: false,
                          textInputAction: TextInputAction.search,
                          controller: _searchController,
                          icon: Icons.search_rounded,
                        ),
                      )
                    : const SizedBox(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Transform.scale(
                      scaleX: -1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.login_outlined,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    constraints.maxWidth > 600
                        ? Text(
                            "Вход",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 13, letterSpacing: 1.1),
                          )
                        : const SizedBox(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
