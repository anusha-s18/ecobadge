import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecobadge/constant/style.dart';
import 'package:iconsax/iconsax.dart';

class Reedem extends StatefulWidget {
  const Reedem({super.key});

  @override
  State<Reedem> createState() => _ReedemState();
}

class _ReedemState extends State<Reedem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    "You did a great job for environment",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Redeem Your Points",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
              Container(
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
                      Icon(
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
                        tween: Tween<double>(begin: 0, end: 1.0),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    'Redeem Points',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction History",
                    style: style,
                  ),
                  CupertinoButton(
                      child: Row(
                        children: [
                          Text("See all", style: lblbtnstyle),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Iconsax.arrow_right_1,
                            size: 20,
                          )
                        ],
                      ),
                      onPressed: () {}),
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.downloading_outlined,color: Colors.green,),
                    title: Text('Credit',style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                    subtitle: Text("Date time"),
                    trailing: Text('+ 100Pts',style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
