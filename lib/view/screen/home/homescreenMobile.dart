
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatcakes/model/cake.dart';
import 'package:eatcakes/theme/theme_const.dart';
import 'package:eatcakes/viewmodel/cakeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../../../utils/constants.dart';
import 'components/popular_product.dart';

//https://blog.logrocket.com/flutter-appbar-tutorial/
//https://protocoderspoint.com/flutter-get-current-location-address-from-latitude-longitude/
//https://medium.com/fabcoding/get-current-user-location-in-flutter-57e202bad6db

class HomeScreenMobile extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  String location ='Null, Press Button';
  String Address = 'search';
  Position? _currentPosition;
  String? _currentAddress;
  int _current = 0;
  final CarouselController _controller = CarouselController();


  _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    GetAddressFromLatLong(_currentPosition!);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    // Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    Address = ' ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
      _currentAddress = Address;
    });
  }
@override
  void dispose() {
   super.dispose();
  }
  @override
  void initState() {
    super.initState();
     // Provider.of<CakeListViewModel>(context, listen: false).fetchMovies("iron man");
     Provider.of<CakeListViewModel>(context, listen: false);
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
    _getGeoLocationPosition();
  }


  didChangeDependencies() {
    super.didChangeDependencies();
    // final value = Provider.of<CakeListViewModel>(context).fetchMovies('iron man');
    //   print(value);

  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CakeListViewModel>(context);


    return Scaffold(
      appBar: AppBar(
        title:
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[

                  const InkWell(
                    child: Icon(Icons.location_pin,
                      color: Colors.red,),
                    /* onTap: (){
                       //action code when clicked
                       print("The icon is clicked");
                     },*/
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        if (_currentPosition != null &&
                            _currentAddress != null)
                          Text(_currentAddress!,
                              style:
                              Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  
                ],
              ),
            ],
          ),
        ),

        centerTitle: true,
      ),
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body:  SafeArea(
        child: SingleChildScrollView(
          child:Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        shadowColor: Colors.blueGrey,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        child:Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              shadowColor: Colors.pink[50],
              elevation: 10,
              clipBehavior: Clip.antiAlias,
             child: CarouselSlider(
              options: CarouselOptions(
                   aspectRatio: 2.0,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  pageViewKey: const PageStorageKey<String>('carousel_slider'),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: images
                  .map((item) => Container(
                child: Center(
                    child:Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                        // Round cornerns  https://stackoverflow.com/questions/53866481/flutter-how-to-create-card-with-background-image
                    // Image.network(item, fit: BoxFit.cover, width: 1000)),
                      child: Image.asset(item, fit: BoxFit.fill, width: 1000),
                    ),
              ),
              ),
              )
                  .toList(),
            ),
     ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: getProportionateScreenWidth(10)),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: items.map((item){
                return Row(
                  children: [
                  Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                    child:
                    Container(
                      width: 100,
                      color: Colors.pink[50],
                      alignment: Alignment.center,
                      child:  Text(
                        item.toString(),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                        ),

                      ),

                    ),
                  ),
                    SizedBox(width: 5,),

                  ],
                );
              }).toList(),
    ),
    ),
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
      ),),),
    );
  }
}
final List<Widget> imageSliders = images
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            // Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${images.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();
