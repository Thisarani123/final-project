import 'dart:io';
import 'package:detectnew/chat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedImagePath = '';
  String detectedDisease = '';


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
            end: Alignment(0, 1),
            colors: <Color>[Color(0xa00b8a27), Color(0x00ffffff)],
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
                                          Color(0x9FFFFFFF),
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
                  height: 4.0,
                ),
                Text(
                  'Upload Image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 148, 4, 14),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white),
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
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 14, 17, 18),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'First select an image from your gallery or capture an image of banana. You are ready to detect the disease.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 26, 10, 200),
                  ),
                ),
              ],
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
                            color: Color.fromARGB(255, 143, 5, 19)),
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

  Future<void> uploadImageAndDetectDisease() async {
    try {
      String result = await detectDiseaseUsingFirebase(selectedImagePath);

      setState(() {
        detectedDisease = result;
      });

      // Upload image to Firebase Storage
      String imageUrl = await uploadToFirebaseStorage(selectedImagePath);

     

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Detected Disease"),
            content: Text(result),
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
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<String> detectDiseaseUsingFirebase(String imagePath) async {
    // Replace this with your disease detection logic
    // Example: Call a machine learning model to classify the image
    // For simplicity, let's assume we have a function that returns the detected disease based on the image path
    String detectedDisease = await classifyImage(imagePath);
    return detectedDisease;
  }

  Future<String> classifyImage(String imagePath) async {
    // Perform image classification using a pre-trained model
    // You can replace this with your actual model inference code
    // For demonstration purposes, let's assume a simple logic to detect the disease based on the file name
    String fileName = imagePath.split('/').last;
    if (fileName.toLowerCase().contains('banana_sigatoka')) {
      return 'Banana Sigatoka';
    } else if (fileName.toLowerCase().contains('banana_xanthomonas')) {
      return 'Banana Xanthomonas';
    } else {
      return 'Healthy Banana';
    }
  }

  Future<String> selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  Future<String> selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  Future<String> uploadToFirebaseStorage(String imagePath) async {
    try {
      File imageFile = File(imagePath);

      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.png');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);

      // Get the image URL from Firebase Storage
      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      return '';
    }
  }

 
  }

