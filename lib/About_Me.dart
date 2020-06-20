import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waller/Waller_Home.dart';

import 'Wallies.dart';
class About_Me extends StatelessWidget {

  int _currentIndex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.deepOrange[800],
          selectedItemBorderColor: Colors.black,
          selectedItemBackgroundColor: Colors.black,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
        ),
        selectedIndex: _currentIndex,
        onSelectTab: (index) {
          if(index==0){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WallerHome()));}
          else if(index ==1){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wallies()));
          }
          else{
          }
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.category,
            label: 'Catagories',
          ),
          FFNavigationBarItem(
            iconData: Icons.image,
            label: 'Wallpapers',
          ),
          FFNavigationBarItem(
            iconData: Icons.person_pin,
            label: 'About Me',
          ),

        ],
      ),
      body: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.deepOrange,Colors.black],begin: Alignment.bottomCenter,end: Alignment.topCenter),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Developer :",style: GoogleFonts.lalezar(fontSize: 25,color: Colors.white),),
                Text("Dhruv Nakum",style: GoogleFonts.holtwoodOneSc(fontSize: 35,color: Colors.white)),
                SizedBox(height: 20.0,),
                Text("E-mail :",style: GoogleFonts.lalezar(fontSize: 15,color: Colors.white),),
                Text("nakumdhruv123@gmail.com",style: GoogleFonts.holtwoodOneSc(fontSize: 15,color: Colors.white)),
              ],
            ),
          )
        ),
      )
    );
  }
}
