import 'package:flutter/cupertino.dart';

class Fade extends StatefulWidget {
  final Widget child;
  final double delay;
  const Fade({
    super.key,
    required this.child,
    required this.delay,
  });

  @override
  State<Fade> createState() => _FadeState();
}

class _FadeState extends State<Fade> 
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> Scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (500*widget.delay).round()),
      vsync: this
    );
    
    animation=Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,)
      )..addListener(() {
        setState(() {});
      });
  
    Scale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent:controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {
        
      });
    });
    controller.forward();
  }

  
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Scale.value,
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

