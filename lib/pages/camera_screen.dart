import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScren extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const CameraScren({Key? key, this.cameras}) : super(key: key);

  @override
  State<CameraScren> createState() => _CameraScrenState();
}

class _CameraScrenState extends State<CameraScren> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.cameras![0], ResolutionPreset.medium);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }
}
