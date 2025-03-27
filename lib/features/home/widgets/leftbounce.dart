import 'package:flutter/cupertino.dart';

class BounceLeft extends StatefulWidget {
  final Widget child;
  final double delay;
  const BounceLeft({super.key,
    required this.child,
    required this.delay
  });

  @override
  State<BounceLeft> createState() => _BounceLeftState();
}

class _BounceLeftState extends State<BounceLeft>  
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
    void initState(){
      super.initState();
      controller = AnimationController(
        duration: Duration(milliseconds: (1500*widget.delay).round()),
        vsync: this,
      );

      final Animation<double> curve = 
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);

      animation=Tween<double>(begin: -100.0, end: 0.0).animate(curve)..addListener(() {setState(() {
      });});

      controller.forward();
    }

    @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: widget.child,
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}