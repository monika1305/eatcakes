import 'package:eatcakes/model/cake.dart';
import 'package:flutter/material.dart';

import '../../../model/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.cake.rating!),
      ),
      body: Body(cake: agrs.cake),
    );
  }
}

class ProductDetailsArguments {
  final Cake cake;

  ProductDetailsArguments({required this.cake});
}
