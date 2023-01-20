
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/mybox.dart';
import '../widgets/mytile.dart';

class HomeScreenTablet extends StatefulWidget {
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 4,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return MyBox();
                  }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return MyTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}