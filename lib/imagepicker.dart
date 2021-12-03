import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class imagepicker extends StatefulWidget {
  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {
  List<Asset> photo =
      <Asset>[]; // ye ak list banaya asset k name see asset k liye
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              // ab ye container me ne image picker k liye banaya he
              height: 250,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      loadImage();
                    },
                    child: Text(
                      'Pick up',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // is container k ander hum image add kare ge
                      width: double.infinity,
                      decoration: addproduct_decoration(),
                      child: photo.length == 0
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            )
                          : GridView.count(
                              crossAxisCount:
                                  3, // yaha niche box me image store karta he
                              children: List.generate(photo.length, (index) {
                                Asset asset = photo[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: AssetThumb(
                                        asset: asset, width: 150, height: 150),
                                  ),
                                );
                              })),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadImage() async {
 
    List<Asset> resultImage = <Asset>[];
    String error = 'something went wrong';
    try {
      resultImage = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: photo,
        // materialOptions: MaterialOptions(
        //   useDetailsView: true,
        // )
      );
    } catch (e) {
      // our yaha par agr error agiya to yaha show ye print hoga
      error = e.toString();
      print(error);
    }
    setState(() {
      photo = resultImage; // image me resultimage store ho jaye ga
    });
  }

  BoxDecoration addproduct_decoration() {
    return BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(14),
    );
  }
}
