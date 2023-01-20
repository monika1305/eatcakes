
import '../model/cake.dart';

class CakeViewModels {

  final Cake cake;

  CakeViewModels({required this.cake});

  String? get title {
    return cake.cakeName;
  }

  // String? get poster {
  //   return cake.cakeImageUrl;
  // }

}