import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecobadge/features/home/widgets/bar.dart';

class Custom extends StatefulWidget {
  IconData icon;
  String iconname;
  String value;
  double percentage;
  double percentIndigator;
  Color color;
  bool downarrow;
  Custom({
    super.key,
    required this.icon,
    required this.iconname,
    required this.value,
    required this.percentage,
    required this.percentIndigator,
    required this.color,
    required this.downarrow,
  });

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.iconname,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  widget.value,
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: widget.percentage),
              builder: (context, value, child) {
                return Row(
                  children: [
                    Text(
                      "${value.toStringAsFixed(0)} %",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      widget.downarrow
                          ? CupertinoIcons.down_arrow
                          : CupertinoIcons.arrow_up,
                      color: Colors.black,
                    )
                  ],
                );
              },
            ),
            Bar(value: widget.percentIndigator, delay: 2)
          ],
        ),
      ),
    );
  }
}
