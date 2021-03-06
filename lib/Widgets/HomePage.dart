import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/BLoc/ShyftBloc.dart';
import 'package:shyft_packers_and_movers/BlocProvider/LoginBLocProvider.dart';
import 'package:shyft_packers_and_movers/Widgets/MovingHomesWidget.dart';
import 'package:shyft_packers_and_movers/Widgets/movingHomeStatusWidget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ShyftBLoc _bLoc;

  @override
  void didUpdateWidget(HomePageWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bLoc = ShyftBLocProvider.of(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

              return FutureBuilder(
                  future: FirebaseAuth.instance.currentUser(),
                  builder: (context, user) {
                      return StreamBuilder(
                        stream: Firestore.instance.document("Users/${user.data?.uid}").snapshots(),
                        builder: (context, snapshot) {
                          return snapshot.hasData?(!snapshot.data["isShyfting"])?Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Select Service",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.black54),
                                  ),
                                ),
                                Flex(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height * 0.2,
                                              child: Image.network(
                                                "https://upload.wikimedia.org/wikipedia/commons/5/53/Les_deux_amis_ayant_aid%C3%A9_%C3%A0_l%27emm%C3%A9nagement_du_troisi%C3%A8me.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Container(
                                              color: Color.fromRGBO(0, 0, 0, 0.4),
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height * 0.2,
                                              padding: EdgeInsets.all(20.0),
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "Moving Home",
                                                style: TextStyle(fontSize: 25.0, color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (ctx) => MovingHomesWidget()));
                                      },
                                    ),
                                  ],
                                  direction: Axis.vertical,
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Container(
                                        child: Text(
                                          "You have a shyfting going on",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ):MovingHomeStatusWidget():Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          );
                        }
                      );
                    }
              );

  }
}
