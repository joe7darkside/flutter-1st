import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Stock_page.dart';
import 'package:myapp/empty.dart';
import 'package:myapp/manage/bank.dart';
import 'package:myapp/maps/kiosks_map.dart';
import 'package:myapp/empty.dart';
import 'package:myapp/register/login.dart';

class MyMoney extends StatelessWidget {
  final double current_balance;
  MyMoney([this.current_balance = 0.0]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Management',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(current_balance),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final double current_balance;
  MyHomePage([this.current_balance = 0.0]);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    /*
    Future<String> _createDialog(BuildContext context) {
      TextEditingController customcontroller = TextEditingController();
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter your salary'),
              content: TextField(
                controller: customcontroller,
              ),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, customcontroller.text);
                  },
                  elevation: 5.0,
                  child: Text('submit'),
                )
              ],
            );
          }).then((val) {
        setState(() {
          print('shit');
          print(current_balance.toString());
          int temp = current_balance;
          current_balance = temp + int.parse(val);
        });
      });
    }
    */

    Color primaryColor = Colors.pinkAccent;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(39, 50, 80, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomShapeClipper(),
                      child: Container(
                        height: 350.0,
                        decoration: BoxDecoration(color: primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 15.0),
                              Text(
                                "\$" + widget.current_balance.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 1.0),
                              Text(
                                'Avilable balance',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19.0),
                              )
                            ],
                          ),
                          Material(
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.blue[300],
                            child: MaterialButton(
                              onPressed: () => _signOut(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 30.0),
                              child: Text(
                                'LogOut',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                      child: Container(
                        width: double.infinity,
                        height: 270.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 15.0)
                            ]),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.purple.withOpacity(0.1),
                                        child: IconButton(
                                          padding: EdgeInsets.all(15.0),
                                          icon: Icon(Icons.send),
                                          color: Colors.purple,
                                          iconSize: 30.0,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpComing()));
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text('Send',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color:
                                            Colors.pinkAccent.withOpacity(0.1),
                                        child: IconButton(
                                          padding: EdgeInsets.all(15.0),
                                          icon: Icon(Icons.monetization_on),
                                          color: Colors.pink,
                                          iconSize: 30.0,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        App()));
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text('Invest',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.orange.withOpacity(0.1),
                                        child: IconButton(
                                          padding: EdgeInsets.all(15.0),
                                          icon: Icon(Icons.attach_money),
                                          color: Colors.orange,
                                          iconSize: 30.0,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyBank(widget
                                                            .current_balance)));
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text('Loan',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Divider(),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Checkout the ATM location',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(width: 40.0),
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blueAccent.withOpacity(0.1),
                                    child: IconButton(
                                      icon: Icon(Icons.location_on),
                                      color: Colors.blueAccent,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => KioskMap(
                                                    title:
                                                        'Kiosks Locations')));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                  child: Text(
                    'Upcoming features',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35.0, bottom: 25.0),
                  child: Container(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        UpcomingCard(
                          title: 'Cred Card One',
                          value: 280.0,
                          color: Colors.purple,
                        ),
                        UpcomingCard(
                          title: 'Cred Card Text Two',
                          value: 260.0,
                          color: Colors.blue,
                        ),
                        UpcomingCard(
                          title: 'Cred Card Text Two',
                          value: 210.0,
                          color: Colors.orange,
                        ),
                        UpcomingCard(
                          title: 'Cred Card Text Two',
                          value: 110.0,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
