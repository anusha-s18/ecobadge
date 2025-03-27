import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecobadge/constant/color.dart';
import 'package:ecobadge/constant/gas_economy.dart';
import 'package:ecobadge/constant/style.dart';
import 'package:ecobadge/features/home/widgets/custom.dart';
import 'package:ecobadge/features/home/widgets/fade.dart';
import 'package:ecobadge/features/home/widgets/leftbounce.dart';
import 'package:ecobadge/router/router.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _db = FirebaseDatabase.instance.ref();
  StreamSubscription? _gasesSub;

  List<double> gasavg = [1, 1, 1];
  List<double> gaspercent = [0.0, 0.0, 0.0];
  double emisssionpercent = 0.0;
  ValueNotifier<double> emissionlister = ValueNotifier(0.0);
  int avgpercent = 50;
  bool _loaded = false;
  GasEconomy gasEconomy = GasEconomy();

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("HomeScreen");

    _db.child("avg").get().then((value) {
      setState(() {
        final temp = value.value as List<dynamic>;
        for(int i = 0; i < temp.length; i++){
          gasavg[i] = temp[i].toDouble();
        }
        _loaded = true;
      });
    });

    _gasesSub = _db.child("gases").child("ABXXCDXXXX").child("current").onValue.listen((event) {
      List<dynamic> temp = event.snapshot.value as List<dynamic>;
      List<double> gasraw = [];
      for(int i = 0; i < temp.length; i++){
        gasraw.add(temp[i].toDouble());
      }

      debugPrint("gasraw: $gasraw");
      setState(() {
        gaspercent = gasEconomy.getpercents(gasraw, gasavg);
        emisssionpercent = gasEconomy.getemissionpercent(gaspercent);
        emissionlister.value = emisssionpercent*100;
        print("gaspercent: $gaspercent");
        print("emisssionpercent: $emisssionpercent");
      });
    });
    
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gasesSub!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    // height: 60,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, User",
                        style: GoogleFonts.poppins(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.teal,
                                Colors.purple,
                              ],
                            )),
                        clipBehavior: Clip.antiAlias,
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Great start of the day, a little more",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "to reach today's goals",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Center(
                        child: SimpleCircularProgressBar(
                              size: 140,
                              mergeMode: true,
                              valueNotifier: emissionlister,
                              progressColors: (emisssionpercent>0.75)?[Colors.red,Colors.red]:((emisssionpercent > 0.6)?[Colors.yellow,Colors.yellow]:[Colors.green,Colors.green]),
                              
                              onGetText: (double value){
                                // print("test3 ${_emissionPerCent}");
                                // print("test4 ${value}");
                                return Text("${(value).toInt()}%",style: TextStyle(fontSize: 24),);
                              },
                            ),
                          
                        
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Emission Percentage",style: style,)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BounceLeft(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Credit's",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    // height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.energy_savings_leaf,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Credits",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TweenAnimationBuilder<double>(
                            duration: const Duration(seconds: 2),
                            tween: Tween<double>(begin: 0, end: 12.0),
                            builder: (context, value, child) {
                              return Row(
                                children: [
                                  Text(
                                    "${value.toStringAsFixed(0)} points",
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  
                  const SizedBox(height: 20,),
                  
                  CupertinoButton(
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Redeem Credits",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    onPressed: () {
                      context.push(Routes.redeem.path);
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Fade(
                        delay: 2,
                        child: Custom(
                            icon: CupertinoIcons.cloud,
                            iconname: "CO",
                            value: "50",
                            percentage: gaspercent[0]*100,
                            percentIndigator: gaspercent[0],
                            color: firstcard,
                            downarrow: false),
                      ),
                      Fade(
                        delay: 2,
                        child: Custom(
                          icon: CupertinoIcons.clock,
                          iconname: "CO2",
                          value: "50",
                          percentage: gaspercent[1]*100,
                          percentIndigator: gaspercent[1],
                          color: secondcard,
                          downarrow: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Fade(
                        delay: 2,
                        child: Custom(
                            icon: CupertinoIcons.captions_bubble,
                            iconname: "TOL",
                            value: "50",
                            percentage:gaspercent[2]*100,
                            percentIndigator: gaspercent[2],
                            color: thirdcard,
                            downarrow: false),
                      ),
                      Fade(
                        delay: 2,
                        child: Custom(
                          icon: CupertinoIcons.clock,
                          iconname: "SO2",
                          value: "60 ",
                          percentage: 50,
                          percentIndigator: 0.1,
                          color: fourthcard,
                          downarrow: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


