
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.color, this.onPressed,this.backgroundColor});
  String text;
  Color color;
  VoidCallback? onPressed;
  Color? backgroundColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(340, 35), backgroundColor: backgroundColor ),
      onPressed:onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: 24,
        ),
      ),
    );
  }
}
