

import 'dart:ffi';

class Cake {


  final int? id;
  final String? cakeName;
  final String? cakeCreatedDate;
  final String? cakeExpiredDate;
  final List<String>? images;
  final List<String>? types;

  // final String? cakeImageUrl;
  final List<int>? cakePrice;
  final String? description;
  final double? rating;
  final bool? isFavourite;
  final bool? isPopular;


  Cake({
    this.id,
    this.cakeName,
    this.cakeCreatedDate,
    this.cakeExpiredDate,
    this.images,
    this.types,
    this.cakePrice,
    this.description,
    this.rating,
    this.isFavourite,
    this.isPopular,
  });

  // factory Cake.fromJson(Map<String, dynamic> json) {
  //
  //   return Cake(
  //     cakeName: json['cakeName'] as String?,
  //     cakeType: json['cakeType'] as String?,
  //     cakeCreatedDate: json['cakeCreatedDate'] as String?,
  //     cakeExpiredDate: json['cakeExpiredDate'] as String?,
  //     cakeImageUrl: json['cakeImageUrl'] as String?,
  //     cakePrice: json['cakePrice'] as Double?,
  //   );
  // }



}
 const String descriptions =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

List<Cake> demoCakes = [
  Cake(
    id: 1,
    cakeName: "Black Forest Cake",
    cakeCreatedDate: "12/01/2023",
    cakeExpiredDate: "12/01/2023",
    images: [
      "assets/images/black_forest.jpg",
    ],
    types: [
      "500",
      "1000",
    ],
    cakePrice: [350,
      890,
    ],
    description: descriptions,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),    Cake(
    id: 2,
    cakeName: "Crunchy ButterScotch Cake",
    cakeCreatedDate: "12/01/2023",
    cakeExpiredDate: "12/01/2023",
    images: [
      "assets/images/crunchy_butterscotch.jpg",
    ],
    types: [
      "500",
      "1000",
    ],
    cakePrice: [350,
      890,
    ],
    description: descriptions,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),    Cake(
    id: 3,
    cakeName: "Fruit Cake",
    cakeCreatedDate: "12/01/2023",
    cakeExpiredDate: "12/01/2023",
    images: [
      "assets/images/fruit.jpg",
    ],
    types: [
      "500 grams",
      "1000 grams",
    ],
    cakePrice: [350,
      890,
    ],
    description: descriptions,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),    Cake(
    id: 4,
    cakeName: "Rainbow Cake",
    cakeCreatedDate: "12/01/2023",
    cakeExpiredDate: "12/01/2023",
    images: [
      "assets/images/rainbow.jpeg",
    ],
    types: [
      "500",
      "1000",
    ],
    cakePrice: [350,
      890,
    ],
    description: descriptions,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),

];


