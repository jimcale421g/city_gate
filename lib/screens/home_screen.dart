import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:city_guide/json/daily_json.dart';
import 'package:city_guide/models/user_model.dart';
import 'package:city_guide/screens/login_screen.dart';
import 'package:city_guide/screens/zaad_shilling.dart';
import 'package:city_guide/screens/zaad_usd.dart';
import 'package:city_guide/screens/e_dahab_shilling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'e_dahab_usd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  //initialize firebase call for users
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("userd")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                  image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.contain)
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,

                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('User'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
            ListTile(
              leading: Icon(Icons.approval),
              title: Text('App Activity'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Access Time'),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('System Health'),
            ),
            ListTile(
              leading: Icon(Icons.psychology),
              title: Text('Log'),
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('check for updates'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.mediation),
              title: Text('Service Media'),
            ),
            ListTile(
              leading: Icon(Icons.hardware),
              title: Text('Hardware Test'),
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('Info'),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),

            ),

          ],
        ),
      ),
      bottomNavigationBar: getFooter(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: Icon(
          Icons.person,
          size: 25,
        ),
        //backgroundColor: ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("ZAAD & E-DAHAB TRANS MANAGER"),
        centerTitle: true,
      ),

      // body: Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 180,
      //           child: Image.asset(
      //             "assets/logo.png",
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //          Text("Welcome Back",
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.red,
      //                 fontWeight: FontWeight.bold)),
      //          SizedBox(height: 10),
      //        Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
      //             style: TextStyle(
      //               color: Colors.blueAccent,
      //               fontWeight: FontWeight.w300,
      //             )),
      //          Text("${loggedInUser.email} ",
      //             style: TextStyle(
      //               color: Colors.deepPurpleAccent,
      //               fontWeight: FontWeight.w300,
      //             )),
      //          SizedBox(
      //           height: 15,
      //         ),
      //         ActionChip(label: const Text("Logout"), onPressed: (){
      //           logout(context);
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        MyInbox1(), //ZAAD SHILLING
        MyInbox2(), //E-DAHAB SHILLING
        MyInbox3(), //ZAAD USD
        MyInbox4(), //E-DAHAB USD

        Center(
          child: Text("Stats Page"),
        ),
        Center(
          child: Text("Budget Page"),
        ),
        Center(
          child: Text("Profile Page"),
        ),
        Center(
          child: Text("Create Budget Page"),
        )
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.card,
      Ionicons.bar_chart,
      Ionicons.pie_chart,
      Ionicons.stats_chart,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: Colors.red.withOpacity(0.9),
        backgroundColor: Colors.lightGreen,
        inactiveColor: Colors.black,
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 20,
        rightCornerRadius: 10,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
