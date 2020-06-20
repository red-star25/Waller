import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waller/Catagories.dart';
import 'package:waller/Catagories/Abstract.dart';
import 'package:waller/Catagories/Art.dart';
import 'package:waller/Catagories/Coding.dart';
import 'package:waller/Catagory_Model.dart';
import 'About_Me.dart';
import 'Catagories/Games.dart';
import 'Catagories/Movies.dart';
import 'Catagories/Space.dart';
import 'SizeConfig.dart';
import 'Wallies.dart';

class WallerHome extends StatefulWidget {
  @override
  _WallerHomeState createState() => _WallerHomeState();
}

class _WallerHomeState extends State<WallerHome> {

  String apiKey = "563492ad6f91700001000001716a6aeb690943759bb34575c8eb8ee3 ";
  List<Catagory_Model> catagory = List();

  @override
  void initState() {
   catagory = getCatagory();
    super.initState();
  }

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          if(index==0){}
          else if(index ==1){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wallies()));
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
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.blockSizeHorizontal * 100,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: SizeConfig.blockSizeVertical * 7,),
                  Row(
                    children: <Widget>[
                      Text("Wall",style: GoogleFonts.creteRound(fontSize: SizeConfig.blockSizeVertical * 6,color: Colors.white)),
                      Text("ER",style: GoogleFonts.creteRound(fontSize: SizeConfig.blockSizeVertical * 6,color: Colors.red)),
                    ],
                  ),
                  Text("Wallpaper 4U",style: GoogleFonts.creteRound(fontSize:SizeConfig.blockSizeVertical * 3,color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 4,),
            ElasticInUp(
              child: Container(
                  height: SizeConfig.blockSizeVertical * 67,
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return CatagoryTiles(
                        imageUrl: catagory[index].imageUrl,
                        catagoryName: catagory[index].catagoryName,
                        function: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pages[index]));},
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      );
                    },
                    itemCount: catagory.length)
              ),
            )
          ],
        )
      ),
    );
  }

  var pages=[
    Art(),
    Abstract(),
    Games(),
    Movies(),
    Coding(),
    Space()
  ];
}



class CatagoryTiles extends StatelessWidget {

   final imageUrl;
   final catagoryName;
   final Function function;
   CatagoryTiles({@required this.catagoryName,@required this.imageUrl,@required this.function});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(70.0),
          child: InkWell(
            onTap: function,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context,url)=>Container(child:Center(child:SpinKitRipple(color: Colors.black,size: 50,))),
              )
            ),
          ),
        ),
        Center(
          child: Container(
            child: Text(catagoryName,style: GoogleFonts.creteRound(fontSize: SizeConfig.blockSizeVertical * 6,color: Colors.white),),
          ),
        ),
      ],
    );
  }
}



