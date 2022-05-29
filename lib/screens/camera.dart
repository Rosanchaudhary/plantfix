import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Plantfix/screens/image_preview.dart';
import 'dart:async';

import '../constants.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/services.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late List cameras;
  late int selectedCameraId;
  late String imagePath;
  late XFile _image;
  final picker = ImagePicker();
  bool _flashIsOn = false;

  Future<void> _openImagePicker() async {
    HapticFeedback.heavyImpact();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // setState(() {
      //   _image = XFile(pickedImage.path);
      // });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImagePreview(
            imagePath: pickedImage.path,
          ),
        ),
      );
    }
  }

  // ignore: unused_element
  void _onCapturePressed(context) async {}

  void _onSwitchCamera() {
    HapticFeedback.heavyImpact();
    selectedCameraId =
        selectedCameraId < cameras.length - 1 ? selectedCameraId + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraId];
    _initCameraController(selectedCamera);
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    await _controller?.dispose();
    _controller = CameraController(cameraDescription, ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg); //can change resolution
    _controller?.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (_controller!.value.hasError) {
        print('Camera error ${_controller!.value.errorDescription}');
      }
    });
    try {
      await _controller!.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (!_controller!.value.isInitialized) {
      return Container(child: Center(child: const CircularProgressIndicator()));
    }
    return AspectRatio(
        aspectRatio: 1 / _controller!.value.aspectRatio,
        child: CameraPreview(
          _controller!,
        ));
  }

  @override
  void initState() {
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraId = 0;
        });
        _initCameraController(cameras[selectedCameraId]).then((void v) {});
        print('Camera selected');
      } else {
        print("No camera available");
      }
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  _flashIsOn = !_flashIsOn;
                  if (_flashIsOn) {
                    _controller!.setFlashMode(FlashMode.off);
                  } else {
                    _controller!.setFlashMode(FlashMode.torch);
                  }
                });
              },
              child: _flashIsOn
                  ? Icon(Icons.flash_off_outlined, size: 30)
                  : Icon(Icons.flash_on_outlined, size: 30)),
          SizedBox(width: 10),
        ],
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kWhiteGrey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "SCAN",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _openImagePicker();
            },
            child: Icon(FontAwesomeIcons.image),
            backgroundColor: Colors.black,
          ),
          FloatingActionButton(
            onPressed: () async {
              HapticFeedback.heavyImpact();
              _image = await _controller!.takePicture();
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImagePreview(
                    imagePath: _image.path,
                  ),
                ),
              );
            },
            elevation: 100,
            highlightElevation: 60,
            backgroundColor: Colors.black,
            child: SvgPicture.asset(
              'assets/logos/shutter.svg',
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _onSwitchCamera();
            },
            child: Icon(CupertinoIcons.camera_rotate),
            backgroundColor: Colors.black,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _cameraPreviewWidget(),
    );
  }
}
