import 'dart:io';

import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectAnemiaByImage extends StatefulWidget {
  @override
  DetectAnemiaByImageState createState() => DetectAnemiaByImageState();
}

class DetectAnemiaByImageState extends State<DetectAnemiaByImage> {
  File? _pickedImage;
  Color containerColor = const Color(0xFFB0B0B0); // Default color

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        containerColor = Colors.transparent; // Change color when image is picked
      });
    }
  }

  Widget buildBackButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.lightPrimaryColor,
        size: 25.0,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget buildHeaderText() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Upload your Photo',
            style: TextStyle(
              color: AppColors.lightPrimaryColor,
              fontSize: 24,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        Text(
          'File should be JPG , PNG',
          style: TextStyle(
            color: Color(0xFF535354),
            fontSize: 16,
            fontFamily: 'Kodchasan',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ],
    );
  }

  Widget buildImageContainer() {
    return _pickedImage != null
        ? Image.file(
            _pickedImage!,
            fit: BoxFit.cover,
          )
        : Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Duration of color transition
              width: 203,
              height: 203,
              padding: const EdgeInsets.all(30),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 7, color: containerColor), // Use animated color here
                  borderRadius: BorderRadius.circular(128),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 56.01,
                          height: 48,
                          child: Stack(
                            children: [
                              Image.asset(
                                  'lib/core/utils/appImages/images/uploadimage.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'Drag & drop  or',
                    style: TextStyle(
                      color: Color(0xFF535354),
                      fontSize: 16,
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget buildChooseFileButton() {
    return Center(
      child: ElevatedButton(
        onPressed: pickImageFromGallery,
        child: Container(
          width: 197,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [AppColors.lightBlackColor, AppColors.lightPrimaryColor],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choose File',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  buildBackButton(),
                  const SizedBox(
                    width: 30,
                  ),
                  buildHeaderText(),
                ],
              ),
              buildImageContainer(),
              const SizedBox(height: 20),
              buildChooseFileButton(),
            ],
          ),
        ),
      ),
    );
  }

}
