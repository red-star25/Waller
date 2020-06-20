import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:waller/SizeConfig.dart';

class ImageView extends StatefulWidget {
  String imagePath;
  ImageView({this.imagePath});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();

  var filePath;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffold_state,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imagePath,
            child: Container(
                height: SizeConfig.blockSizeVertical * 100,
                width: SizeConfig.blockSizeHorizontal * 100,
                child: CachedNetworkImage(
                  imageUrl: widget.imagePath,
                  fit: BoxFit.cover,
                  placeholder: (context,url)=>Container(child:Center(child:CircularProgressIndicator())),
                )),
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 100,
            width: SizeConfig.blockSizeHorizontal * 100,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Set Wallpaper",
                                style: GoogleFonts.lalezar(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                "Image will be saved in Gallery",
                                style: GoogleFonts.lalezar(
                                    fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ],
                  ),
                  onTap: () {
                    _save();
                    final snackBar = SnackBar(
                      content: Text(
                        'Added To Gallery',
                        style: TextStyle(fontSize: 16),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    );
                    scaffold_state.currentState.showSnackBar(snackBar);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.deepOrange
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.lalezar(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    var response = await Dio().get(widget.imagePath,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }
}
