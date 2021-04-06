import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  final int cameraId;

  CameraScreen({Key key, this.cameraId}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  List<CameraDescription> cameras;
  int cameraId = 1;

  @override
  void initState() {
    super.initState();
    if (widget.cameraId != null) cameraId = widget.cameraId;

    _initCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && !controller.value.isInitialized) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 5),
        ),
      );
    }
    return controller == null
        ? Container()
        : AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                CameraPreview(controller),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.camera_front,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: _switchCamera,
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.camera,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => _captureImage(context),
                )
              ],
            ));
  }

  void _initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[cameraId], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void _switchCamera() {
    if (cameraId == 1)
      cameraId = 0;
    else
      cameraId = 1;

    _initCamera();
  }

  void _captureImage(BuildContext context) async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Construct the path where the image should be saved using the path
      // package.
      final path = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Attempt to take a picture and log where it's been saved.
      await controller.takePicture(path);

      print("Image saved at: $path");
      Navigator.pop(context, path);
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
