import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      this.prefixIcon,
      this.isPassword,
      this.suffixIcon,
      this.hintText,
      this.borderColor,
      this.validate,
      this.controller});
  String? hintText;
  IconData? prefixIcon;
  TextEditingController? controller;
  IconData? suffixIcon;
  Color? borderColor;
  bool? isPassword = false;
  final String? Function(String?)? validate;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        validator: (widget.isPassword == true)
            ? (data) {
                if (data!.length < 6 || data.isEmpty) {
                  return 'enter valid password';
                }
                return null;
              }
            : (widget.hintText == 'email'||widget.hintText == 'Email')
                ? (data) {
                    if (data!.isEmpty || !data.contains('@gmail.com')) {
                      return 'please enter valid email';
                    }
                    return null;
                  }
                : widget.validate,
        obscureText: widget.isPassword == true ? _isHidden : false,
        style: TextStyle(color: widget.borderColor ?? Colors.white),
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.borderColor ?? Colors.white,
          ),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    _togglePasswordView();
                  },
                  icon: _isHidden == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  color: widget.borderColor ?? Colors.white,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 13),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          //   focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color:borderColor??Colors.white),
          //   borderRadius: BorderRadius.circular(16),
          // ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
