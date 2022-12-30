// import 'dart:html';
//
// import 'package:flutter/material.dart';
// class get_address extends StatefulWidget {
//   const get_address({Key? key}) : super(key: key);
//
//   @override
//   State<get_address> createState() => _get_addressState();
// }
//
// class _get_addressState extends State<get_address> {
//   TextEditingController latitudeController= new TextEditingController();
//   TextEditingController longitudeController= new TextEditingController();
// String stAddress="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Map Current Address'),
//         backgroundColor: Colors.black26,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Get Address From Coordinates', style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),),
//               SizedBox(height: 10,),
//               TextField(
//                 controller: latitudeController,
//                 decoration: InputDecoration(
//                     hintText: 'latitude',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)
//                     )
//                 ),
//               ),
//               SizedBox(height: 10,),
//               TextField(
//                 controller: longitudeController,
//                 decoration: InputDecoration(
//                     hintText: 'Longitude',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   child: Center(child: Text(stAddress),),
//                 ),
//               ),
//               SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () async {
//                   String lat = latitudeController.text;
//                   String lon = longitudeController.text;
//                   double lat_data = double.parse(lat);
//                   double lon_data = double.parse(lon);
//                   final coordinates = Coordinates(lat_data, lon_data);
//                   var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//                   var first = address.first;
//                   setState(() {
//                     stAddress = first.addressLine.toString();
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                     ),
//                     height: 50,
//                     child: Center(
//                       child: Text('Convert', style: TextStyle(color: Colors
//                           .white),),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocode/geocode.dart';
class Convert_Lat_Long extends StatefulWidget {
  const Convert_Lat_Long({Key? key}) : super(key: key);

  @override
  State<Convert_Lat_Long> createState() => _Convert_Lat_LongState();
}

class _Convert_Lat_LongState extends State<Convert_Lat_Long> {
  String? mkey="AIzaSyC-CToAEQx2YdzRvWM5Ww8N_TLSsFnQoqI";
  TextEditingController latitudeController=new TextEditingController();
  TextEditingController longitudeController=new TextEditingController();

  String stAddress="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google map Current Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Get Address from Coordinates",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10),
              TextField(
                controller: latitudeController,
                decoration: InputDecoration(
                    hintText: 'Latitude',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextField(controller: longitudeController,
                decoration: InputDecoration(
                    hintText: 'Longitude',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 10,),
              Padding(padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(child: Text(stAddress),),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: ()async{
                  String lat=latitudeController.text;
                  String lon=longitudeController.text;

                  double lat_data=double.parse(lat);
                  double lon_data=double.parse(lon);

                  // final coordinates=Coordinates(lat_data,lon_data);
                  final coordinates=Coordinates(latitude: lat_data,longitude: lon_data);
                  // var address=await GeocodingPlatform.local.findAddressesFromCoordinates(coordinates);
                  var address=await GeocodingPlatform.instance.placemarkFromCoordinates(lat_data, lon_data);
                  //getDataFromCoordinates(latitude: lat_data, longitude: lon_data, googleMapApiKey: "AIzaSyC-CToAEQx2YdzRvWM5Ww8N_TLSsFnQoqI");
                  var country=address.first.country;
                  var locality=address.first.locality;


                  setState(() {
                    // stAddress=first.addressLine.toString();
                    //stAddress=address.address.toString();
                    // stAddress=address.toString();
                    stAddress=country.toString()+"  "+locality.toString();

                  });
                },
                child: Padding(padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    height: 50,
                    child: Center(
                      child: Text('Convert',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
