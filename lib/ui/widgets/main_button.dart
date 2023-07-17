import 'package:flutter/material.dart';

class BigButton extends StatefulWidget {
  const BigButton({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  Color color = const Color(0xFFA04ACF);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.onPrimaryContainer;
        });
      },
      onExit: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.primaryContainer;
        });
      },
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            color = Theme.of(context).colorScheme.primaryContainer;
          });
        },
        onTapUp: (details) {
          setState(() {
            color = Theme.of(context).colorScheme.onPrimaryContainer;
            widget.onTap();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(widget.title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
          ),
        ),
      ),
    );
  }
}
