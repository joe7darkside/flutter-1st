import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
                .createUserWithEmailAndPassword(email: _email, password: _password)).user;
        
        print('$user.uid');
      } catch (e) {
        print('$e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
          Colors.purple[400],
          Colors.cyanAccent,
          Colors.teal[400]
        ], begin: Alignment.bottomLeft, end: Alignment.topRight, stops:[0.2,0.5,0.9])),
      child: ListView(
        children: <Widget>[
          Container(
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo1.png'),
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
                            child: TextFormField( keyboardType: TextInputType.emailAddress,
                              validator: (value) => value.isEmpty
                                  ? 'Email cant be empty'
                                  : null,
                              onSaved: (value) => _email = value,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Email"),
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
                              validator: (value) => value.isEmpty
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
                        Navigator.pop(context);
                       
                      },
                      textColor: Colors.black,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF69F0AEF),
                              Color(0xFF00E676),
                              Color(0xFF26A69A),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create',
                            style:
                                TextStyle(fontSize: 23, color: Colors.black54),
                          ),
                        ),
                      ),
                    )),
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Already have one? Login'))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
