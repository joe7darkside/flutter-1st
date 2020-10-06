import 'package:flutter/material.dart';

class MyBank extends StatelessWidget {
 final double _amount;
  MyBank([this._amount]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bank(_amount),
    );
  }
}


class Bank extends StatefulWidget {
  final double _amount;
  Bank([this._amount]);

  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Color.fromRGBO(39, 50, 80, 1),
            appBar: AppBar(
              title: Text("TRANSACTIONS"),
              centerTitle: true,
              backgroundColor: Colors.pinkAccent,
            ),
            body: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            "assets/images/bar.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Ayesha Fatima",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        )
                      ],
                    )),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.pink[400]]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Total Transaction Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "\$" + widget._amount.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 42),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  "ALL TRANSACTIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(55, 65, 104, 1),
                          ),
                          child: ListTile(
                            title: Text(
                              "Transaction $index",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            subtitle: Text(
                              "Some brief detail of transaction no $index",
                              style: TextStyle(color: Colors.white),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 16, right: 16, top: 5, bottom: 5),
                            trailing: Text(
                              "DEBIT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
