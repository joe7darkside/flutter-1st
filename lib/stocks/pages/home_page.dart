import 'package:flutter/material.dart';
import 'package:myapp/manage/money.dart';
import 'package:provider/provider.dart';

import 'package:myapp/stocks/view_models/home_page_view_model.dart';
import 'package:myapp/stocks/widgets/stock_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    Provider.of<HomePageViewModel>(context, listen: false).load();
  }

  void _filterStocks(String searchTerm) {
    Provider.of<HomePageViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomePageViewModel>(context);

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(appBar: AppBar(title:Text("Easy money")),

            //fix bottom overflow
            resizeToAvoidBottomPadding: false,
            body: Stack(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Stocks",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          Text("January 5",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                              height: MediaQuery.of(context).size.height - 310,
                              child: StockList(stocks: vm.stocks))
                        ]),
                  )),
            ])));
  }
}
/*
fix search bar
Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                        height: 50,
                        child: TextField(
                          onChanged: _filterStocks,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: "Search",
                              prefix: Icon(Icons.search),
                              fillColor: Colors.grey[800],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                        )),
                  )
                  */
