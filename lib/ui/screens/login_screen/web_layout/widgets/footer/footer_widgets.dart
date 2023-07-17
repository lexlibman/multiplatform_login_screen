import 'package:flutter/material.dart';

class SocialLinkIcon extends StatelessWidget {
  const SocialLinkIcon({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      padding: const EdgeInsets.all(9),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Image.asset(imageAsset),
    );
  }
}

class FooterHeadline extends StatelessWidget {
  const FooterHeadline({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(color: Colors.white),
    );
  }
}

class FooterLink extends StatefulWidget {
  const FooterLink({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
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
        onTap: widget.onTap(),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
                decoration: isHover ? TextDecoration.underline : null,
              ),
        ),
      ),
    );
  }
}
