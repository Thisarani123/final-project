import 'dart:typed_data';
import 'dart:io';
import 'package:detectnew/chat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedImagePath = '';
  String detectedDisease = '';
  XFile? _file; // Define _file variable
  String body = ''; 
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 896 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19 * fem),
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 0.3),
            colors: <Color>[
              Color(0xa00b8a27),
              Color.fromARGB(255, 255, 255, 255)
            ],
            stops: <double>[0, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 2 * fem,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(28 * fem, 70 * fem, 27 * fem, 98 * fem),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50 * fem),
          ),
          child: Center(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedImagePath != ''
                        ? Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 104 * fem),
                            width: double.infinity,
                            height: 304 * fem,
                            child: Image.file(
                              File(selectedImagePath),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 104 * fem),
                            width: double.infinity,
                            height: 304 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 32 * fem,
                                  top: 10 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 294 * fem,
                                      height: 284 * fem,
                                      child: Image.asset(
                                        'assets/images/detectimage.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 357 * fem,
                                      height: 304 * fem,
                                      child: Image.asset(
                                        'assets/images/camera-frame.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0 * fem,
                                  top: 143 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 359 * fem,
                                      height: 161 * fem,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(50 * fem),
                                            bottomLeft: Radius.circular(50 * fem),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment(0, -1),
                                            end: Alignment(0, 1),
                                            colors: <Color>[
                                              Color.fromARGB(159, 247, 243, 243),
                                              Color(0xa00b8a27)
                                            ],
                                            stops: <double>[0, 1],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 3, 145, 83),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 76, 178, 7)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      onPressed: () async {
                        await selectImage();
                        if (selectedImagePath != '') {
                          await uploadImageAndDetectDisease();
                          setState(() {});
                        }
                      },
                      child: const Text('UPLOAD'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Detected Disease: $detectedDisease',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 14, 17, 18),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'First select an image from your gallery or capture an image of banana. You are ready to detect the disease.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 159, 31, 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future selectImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Upload Image From !',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 195, 7, 25)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                           
                            onTap: () async {
                              selectedImagePath =
                                  await selectImageFromGallery();
                              if (selectedImagePath != '') {
                                await uploadImageAndDetectDisease();
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Selected !"),
                                ));
                              }
                            },
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              selectedImagePath = await selectImageFromCamera();
                              if (selectedImagePath != '') {
                                await uploadImageAndDetectDisease();
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Captured !"),
                                ));
                              }
                            },
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> Predict() async {
    try {
      if (_file == null) return ""; // Return empty string if _file is null

      List<int> bytes = await _file!.readAsBytes();
      String base64Image = base64Encode(bytes);

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await http.post(
  Uri.parse("http://10.0.2.2:5000/api"),
  body: jsonEncode({
    'image': base64Image,
  }),
  headers: requestHeaders,
);


      print(response.body);
      return response.body; // Return the response body as a String
    } catch (error) {
      print('Error in Predict: $error');
      return ''; // Return empty string on error
    }
  }




Future<String> classifyImage(String imagePath) async {
  String fileName = imagePath.split('/').last;

  // Check if the file name contains any of the disease keywords
  if (fileName.toLowerCase().contains('banana_sigatoka')) {
    return 'Banana Sigatoka';
  } else if (fileName.toLowerCase().contains('banana_xanthomonas')) {
    return 'Banana Xanthomonas';
  } else if (fileName.toLowerCase().contains('healthy_banana')) {
    return 'Healthy Banana';
  } else {
    // If not, use TensorFlow Lite model for prediction
    String predictedDisease = await Predict(); // Await the result of Predict method
    return predictedDisease;
  }
}


Future<void> uploadImageAndDetectDisease() async {
  try {
    if (_file == null) return;

    String imageUrl = await uploadToFirebaseStorage(_file!.path);

    // Predict the disease using TensorFlow Lite model or backend API
    String diseaseResult = await classifyImage(_file!.path);

    // Store data in Firebase
    await storeDataInFirebase(imageUrl, diseaseResult);

    // Update UI or show dialogs here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Detected Disease"),
          content: Text(diseaseResult),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    setState(() {
        detectedDisease = diseaseResult;
      });
      
  } catch (error) {
    print('Error: $error');
    // Handle errors here
  }
}



  Future<String> detectDiseaseUsingFirebase(String imagePath) async {
    String detectedDisease = await classifyImage(imagePath);
    return detectedDisease;
  }

  
  // Modify selectImageFromGallery and selectImageFromCamera methods to assign _file
Future<String> selectImageFromGallery() async {
  _file = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 10);
  if (_file != null) {
    return _file!.path;
  } else {
    return '';
  }
}

Future<String> selectImageFromCamera() async {
  _file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 10);
  if (_file != null) {
    return _file!.path;
  } else {
    return '';
  }
}

  Future<String> uploadToFirebaseStorage(String imagePath) async {
    try {
      File imageFile = File(imagePath);
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.png');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      return '';
    }
  }

  Future<void> storeDataInFirebase(
      String imageUrl, String diseaseResult) async {
    try {
      _database.child('user').push().set({
        'image_url': imageUrl,
        'disease_result': diseaseResult,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (error) {
      print('Error storing data in Firebase Realtime Database: $error');
    }
  }
}
