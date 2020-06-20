import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waller/Waller_Home.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<Widget> downloadData(){
    return Future.delayed(Duration(seconds: 2),(){
      return Navigator.push(context, MaterialPageRoute(builder: (context)=>WallerHome()));
    }); //Future.delayed
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepOrange,Colors.black],begin: Alignment.bottomCenter,end: Alignment.topCenter),
        ),
        child: Center(
          child: FutureBuilder<Widget>(
            future: downloadData(),
            builder: (context,datasnapshot){
              if(datasnapshot.connectionState==ConnectionState.done){
                return Text("");
              }else{
                return SpinKitCubeGrid(color: Colors.white,size: 60,);
              }
            },
          ),
        ),
      ),
    );
  }
}
