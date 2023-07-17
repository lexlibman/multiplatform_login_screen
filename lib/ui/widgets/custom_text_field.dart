import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.isObscure,
    required this.textInputAction,
    this.icon,
    required this.controller,
    this.validator,
  });

  final String label;
  final bool isObscure;
  final TextInputAction textInputAction;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.disabled,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: Theme.of(context).colorScheme.outline,
        decoration: InputDecoration(
          errorMaxLines: 2,
          suffixIcon: Icon(
            widget.icon,
            color: _isHover
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
          ),
          focusColor: Theme.of(context).colorScheme.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _isHover
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          label: Text(
            widget.label,
            style: TextStyle(
              color: _isHover
                  ? Theme.of(context).colorScheme.outline
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        textInputAction: widget.textInputAction,
        style: const TextStyle(
            color: Color(0xFF59607A), fontWeight: FontWeight.w400),
        obscureText: widget.isObscure,
      ),
    );
  }
}
