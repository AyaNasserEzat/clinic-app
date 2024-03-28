import 'package:clinic/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonIcon extends StatelessWidget {
   ElevatedButtonIcon({super.key,required this.label,required this.onPressed});
 String  label;
 VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            elevation: 0),
                                        onPressed: onPressed,
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: AppColor.primary,
                                        ),
                                        label: Text(
                                                  label,
                                                  style: GoogleFonts.poppins(
                                                    color: AppColor.primary,
                                                    fontSize: 18,
                                                  ),
                                        ),
                                                ),
                                              );
  }
}