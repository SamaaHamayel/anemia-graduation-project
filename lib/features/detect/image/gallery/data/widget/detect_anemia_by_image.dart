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

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  Widget _buildBackButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.lightPrimaryColor,
        size: 25.0,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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

  Widget _buildImageContainer() {
    return _pickedImage != null
        ? Image.file(
            _pickedImage!,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          )
        : Container(
            width: 203,
            height: 203,
            padding: const EdgeInsets.all(30),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 5, color: Color(0xFFB0B0B0)),
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
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56.01,
                        height: 48,
                        child: Stack(
                          children: [
                            Image.asset('lib/core/utils/appImages/images/uploadimage.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 17),
                Text(
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
          );
  }

  Widget _buildChooseFileButton() {
    return ElevatedButton(
      onPressed: pickImageFromGallery,
      child: Container(
        width: 197,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF2BB598), Color(0xFF398272)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  _buildBackButton(),
                  SizedBox(
                    width: 30,
                  ),
                  _buildHeaderText(),
                ],
              ),
              _buildImageContainer(),
              SizedBox(height: 20),
              _buildChooseFileButton(),
            ],
          ),
        ),
      ),
    );
  }
}
