import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:myapp/manage/money.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:myapp/register/create.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    _email.toString().trim();
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  onSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        print(user.email);
        print('nani');
        String uId = user.uid;

        final x = Firestore.instance
            .collection('user')
            .document(uId)
            .get()
            .then((DocumentSnapshot value) {
          double _salary = value.data['salary'];
          print(value.data['salary']);
          print('oh shit');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyMoney(_salary)));
        });
      } catch (e) {
        print('$e');
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.purple[400],
                  Colors.cyanAccent,
                  Colors.teal[400]
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.5, 0.9])),
        child: ListView(
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/money1.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: SideCutClipper(),
                    child: Container(
                      height: 400,
                      width: 440,
                    ),
                  ),
                  Positioned(
                    left: 320,
                    width: 100,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light2.png'))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Form(
                      autovalidate: true,
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.teal[400],
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => value.isEmpty
                                    ? 'Email cant be empty'
                                    : null,
                                onSaved: (value) => _email = value,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email"),
                              )),
                          Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.teal[400],
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) =>
                                    value.isEmpty || value.length < 6
                                        ? 'Password cant be empty'
                                        : null,
                                onSaved: (value) => _password = value,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password"),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 110),
                      width: 140,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {
                          onSubmit();
                        },
                        textColor: Colors.black,
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF69F0AE),
                                Color(0xFF00E676),
                                Color(0xFF26A69A),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 23, color: Colors.black54),
                            ),
                          ),
                        ),
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Create()));
                        formKey.currentState.reset();
                      },
                      child: Text('Dont have accuont? Create new'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
