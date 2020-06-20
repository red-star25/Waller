import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waller/Catagories/ImageView.dart';
import 'Wallpaper_Model.dart';
Widget wallpaperList({List<WallpaperModel> wallpapers,context}){
  return Container(
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(imagePath:wallpaper.src.portrait)));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: CachedNetworkImage(
                imageUrl: wallpaper.src.portrait,
                fit: BoxFit.cover,
                placeholder: (context,url)=>Container(child:Center(child:SpinKitFadingFour(color: Colors.white,size: 100,))),
                ),
            ),
          ),
        )
        );
      }).toList()
    ),
  );
}