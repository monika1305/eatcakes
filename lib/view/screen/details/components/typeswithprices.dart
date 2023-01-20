
import 'package:eatcakes/model/cake.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../../theme/theme_const.dart';
import '../../../widgets/rounded_icon_btn.dart';

class TypesWithPrices extends StatelessWidget {
  const TypesWithPrices({
    Key? key,
    required this.cake,
  }) : super(key: key);

  final Cake cake;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return SafeArea(
      child:   Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
        Row(
        children: [
          SizedBox(width: 10,),
          Text('(gm)'),
        SizedBox(width: 10,),
        Text('(Rs)'),
        ],),

            Row(
              children: [
                Column(
                  children: [
                    ...List.generate(
                      cake.types!.length,
                          (index) => ColorDot(
                        type: cake.types![index],
                        price: cake.cakePrice![index],
                        isSelected: index == selectedColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {},
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {},
                ),
              ],
            ),
        ],
        ),


      ),
    );

  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.type,
    required this.price,
    this.isSelected = false,
  }) : super(key: key);

  final String type;
  final int price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
        Border.all(color: isSelected ? colorPrimary : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: Row(
        children: [
          Text('$type'),
          SizedBox(width: 25,),
          Text('$price'),
        ],
      ),
    );
  }
}
