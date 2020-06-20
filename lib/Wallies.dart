import 'dart:convert';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/widgets.dart';
import 'package:waller/Waller_Home.dart';
import 'package:waller/Widgets.dart';

import 'About_Me.dart';
import 'Wallpaper_Model.dart';

class Wallies extends StatefulWidget {
  @override
  _WalliesState createState() => _WalliesState();
}

class _WalliesState extends State<Wallies> {
  String apiKey = "563492ad6f91700001000001716a6aeb690943759bb34575c8eb8ee3 ";

  getTrendingWallpaper()async{
    var response =await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1",
        headers: {
          "Authorization":apiKey
        });

    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpaper();
    super.initState();
  }

  List<WallpaperModel> wallpapers = List();

  Future<bool> _onBackPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WallerHome()));
  }

  int _currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
            if(index==0){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WallerHome()));
            }
            else if(index ==1){
            }
            else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>About_Me()));
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
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepOrange,Colors.black],begin: Alignment.bottomCenter,end: Alignment.topCenter),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Text("Popular",style: GoogleFonts.lalezar(fontSize: 50,color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  height: 570,
                  child: wallpaperList(wallpapers:wallpapers,context:context),
                )
              ],
            )
        ),
      ),
    );
  }
}
