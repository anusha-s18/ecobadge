import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        title: Text("Profile",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blueAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Registeration Number',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              Text('ABC5668982XZK',style: TextStyle(fontSize: 14,color: Colors.white,),),
              Text('Owner Name',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              Text('Pankaj Aggarwal ',style: TextStyle(fontSize: 14,color: Colors.white,),),
              Text('Phone Number',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              Text('XXX-XXX-XXXX',style: TextStyle(fontSize: 14,color: Colors.white,),),
              Padding(
                  padding:EdgeInsets.symmetric(horizontal: 30.0,vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    child: Center(
                        child: Text(
                      'Change Details',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
            ],
          ),
        ),
    );


  }
}