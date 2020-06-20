import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/widgets.dart';
import 'package:waller/Waller_Home.dart';
import '../SizeConfig.dart';
import '../Wallpaper_Model.dart';
import '../Widgets.dart';

class Space extends StatefulWidget {
  @override
  _SpaceState createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  String apiKey = "563492ad6f91700001000001716a6aeb690943759bb34575c8eb8ee3 ";

  getTrendingWallpaper()async{
    var response =await http.get("https://api.pexels.com/v1/search?query=space&per_page=80&page=1",
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepOrange,Colors.black],begin: Alignment.bottomCenter,end: Alignment.topCenter),
            ),
            height: SizeConfig.blockSizeVertical * 100,
            width: SizeConfig.blockSizeHorizontal * 100,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Text("Space",style: GoogleFonts.lalezar(fontSize: 50,color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  height:  SizeConfig.blockSizeVertical * 78,
                  child: wallpaperList(wallpapers:wallpapers,context:context),
                )
              ],
            )
        ),
      ),
    );
  }
}
