// ignore: unnecessary_import
// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, unnecessary_import, implementation_imports, depend_on_referenced_packages, unused_import

import 'dart:io';
import 'package:detectnew/sidebar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:detectnew/app_colors.dart';
import 'package:detectnew/green_intro_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class profilesetting extends StatefulWidget {
  const profilesetting({super.key});

  @override
  State<profilesetting> createState() => _profilesettingState();
}

// ignore: camel_case_types
class _profilesettingState extends State<profilesetting> {
  var currentIndex = 0;
  final List<Widget> _children = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

    void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        // You can then upload the selected image to Firestore or any other storage
      } else {
        print('No image selected.');
      }
    });
  }

   FirebaseFirestore firestore = FirebaseFirestore.instance;

  void uploadUserData() async {
  try {
    // Upload image to Firebase Storage
    if (selectedImage != null) {
      String imageUrl = await uploadImageToStorage(selectedImage!);
      
      // Save user data along with the image URL
      await firestore.collection('users').doc().set({
        'name': nameController.text,
        'email': emailController.text,
        'phone_number': phonenumberController.text,
        'password': passwordController.text,
        'profile_image': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User data uploaded successfully'),
      ));

      Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => sidebar(
      profileImageUrl: imageUrl, // Pass profile image URL
      username: nameController.text, // Pass username
      email: emailController.text, // Pass email
    ),
  ),
);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select an image'),
      ));
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Failed to upload user data: $error'),
    ));
  }
}

Future<String> uploadImageToStorage(File imageFile) async {
  try {
    // Get reference to Firebase Storage
    final Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().millisecondsSinceEpoch}');

    // Upload image file to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // Get download URL
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    
    return imageUrl;
  } catch (error) {
    throw error;
  }
}



  void fetchUserData() async {
  try {
    // Assuming the user's data is stored in a document with the user's ID as the document ID
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('users').doc('userId').get();

    if (snapshot.exists) {
      // Populate text controllers with user data
      setState(() {
        nameController.text = snapshot.data()?['name'] ?? '';
        emailController.text = snapshot.data()?['email'] ?? '';
        phonenumberController.text = snapshot.data()?['phone_number'] ?? '';
        passwordController.text = snapshot.data()?['password'] ?? '';
        // Password field shouldn't be populated for security reasons
      });
    } else {
      print('Document does not exist');
    }
  } catch (error) {
    print('Error fetching user data: $error');
  }
}




  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 160, 79),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
  height: 190,
  child: Stack(
    children: [
      greenIntroWidgetWithoutLogos(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 110,
          height: 110,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 193, 193, 195),
          ),
          child: Stack(
            children: [
              // Display uploaded image if available, else display default profile image
              if (selectedImage != null)
                ClipOval(
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                    width: 110,
                    height: 110,
                  ),
                )
              else
                // Display default profile image if no image is uploaded
                // Display default profile image if no image is uploaded
             ClipOval(
               child: Image.asset(
               'assets/images/p.jpg',
              fit: BoxFit.cover,
              width: 110,
              height: 110,
         ),
       ),

              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 4, 13, 20),
                  radius: 15,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Call a function to handle image uploading
                      getImage();
                    },
                  ),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

            const SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget('User Name', Icons.person, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is required!';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFieldWidget(
                        'Email ID', Icons.email_rounded, emailController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Email is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFieldWidget(
                        'Phone Number', Icons.phone, phonenumberController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Phone number is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFieldWidget('Password', Icons.lock, passwordController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Password is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    blackButton('UPDATE', () {
                      if (formKey.currentState!.validate()) {
                        uploadUserData();}}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.person_pin,
  ];

  List<String> listOfStrings = [
    'Home',
    'Profile',
  ];
}

// ignore: non_constant_identifier_names
TextFieldWidget(String title, IconData iconData,
    TextEditingController controller, Function validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        width: 350,
        height: 55,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 251, 251, 249),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          validator: (input) => validator(input),
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,
                color: Color.fromARGB(255, 62, 70, 65),
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      )
    ],
  );
}

Widget blackButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: 180,
    height: 45,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: AppColors.blackColor,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
