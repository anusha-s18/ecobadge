import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  final double value;
  final double delay;
  const Bar({
    super.key,
    required this.value,
    required this.delay
  });

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (1500*widget.delay).round()),
      vsync: this
    );
    _animation = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      )
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller, 
      builder: (context, child){
        return LinearProgressIndicator(
          value: _animation.value,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          minHeight: 4,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          backgroundColor: Colors.transparent.withOpacity(0.1),
        );
      }
    );
  }
}