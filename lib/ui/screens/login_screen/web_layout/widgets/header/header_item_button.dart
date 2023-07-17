import 'package:flutter/material.dart';

class ItemButton extends StatefulWidget {
  const ItemButton({super.key, required this.title});

  final String title;

  @override
  State<ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<ItemButton> {
  bool isHover = false;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isActive = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            isActive = false;
          });
        },
        child: SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(1)),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.transparent,
                        ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: isActive ? 2 : 0,
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: isHover
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
