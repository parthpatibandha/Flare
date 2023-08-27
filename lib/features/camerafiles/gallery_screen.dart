import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flare/core/utils/logger.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flare/features/camerafiles/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  String imagePath = "";

  GalleryScreen({required this.imagePath})
      : super(key: const Key(StringConstants.keyGalleryScreen));

  @override
  GalleryScreenState createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Logger.d("Gallery screen :  ${widget.imagePath}");
    return Scaffold(
      appBar: AppBarWidget(message: StringConstants.screenGallery),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: (widget.imagePath.isNotEmpty == true)
                    ? Image.file(File(widget.imagePath))
                    : Image.asset("assets/img/ic_placeholder.png"),
              ),
              ElevatedButton(
                onPressed: () async {
                  WidgetsFlutterBinding.ensureInitialized();
                  final cameras = await availableCameras();
                  final firstCamera = cameras.first;
                  _navigateToTakePicture(firstCamera);
                },
                child: const Text("Take Picture"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      widget.imagePath = image.path;
                    });
                  }
                },
                child: const Text("Select Picture"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToTakePicture(CameraDescription camera) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TakePictureScreen(camera: camera)),
    );
    if (!mounted) return;
    widget.imagePath = result;
    setState(() {});
  }
}
