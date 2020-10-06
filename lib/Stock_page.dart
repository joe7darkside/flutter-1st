import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stocks/pages/home_page.dart';
import 'stocks/view_models/home_page_view_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
        title: "Stocks",
        home: ChangeNotifierProvider(
            create: (_) => HomePageViewModel(), child: HomePage()));
  }
}
