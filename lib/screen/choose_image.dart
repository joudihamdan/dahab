import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageColorExtractor extends StatefulWidget {
  @override
  _ImageColorExtractorState createState() => _ImageColorExtractorState();
}

class _ImageColorExtractorState extends State<ImageColorExtractor> {
  File? _image;
  Color? _selectedColor;

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _pickColorFromImage(BuildContext context) async {
    if (_image == null) return;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      FileImage(_image!),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor ?? Colors.white,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              availableColors: paletteGenerator.colors.toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('DONE'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image & Pick Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image captured.')
                : GestureDetector(
              onTap: () => _pickColorFromImage(context),
              child: Image.file(_image!),
            ),
            SizedBox(height: 20),
            _selectedColor == null
                ? Container()
                : Container(
              width: 100,
              height: 100,
              color: _selectedColor,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }
}














// import 'dart:developer';
// import 'dart:io';
//
// import 'package:color_extract/color_extract.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// import 'package:palette_generator/palette_generator.dart';
//
// class ChooseImage extends StatefulWidget {
//    ChooseImage({super.key});
//
//   @override
//   State<ChooseImage> createState() => _ChooseImageState();
// }
//
// class _ChooseImageState extends State<ChooseImage> {
//    XFile? _image;
//   final ImagePicker picker = ImagePicker();
//    final boundaryKey = GlobalKey();
//    final _controller = ColorAveragerController();
//    Color? _averageColor;
//
//    @override
//    void initState() {
//      super.initState();
//
//    }
//    // Future<void> _calculateAverageColor(File imageFile) async {
//    //   final image = Image.file(imageFile);
//    //   final paletteGenerator = await PaletteGenerator.fromImageProvider(image.image);
//    //
//    //   setState(() {
//    //     _averageColor = paletteGenerator.dominantColor?.color;
//    //   });
//    // }
//    // Future<void> _calculateAverageColor(File imageFile) async {
//    //   final bytes = await imageFile.readAsBytes();
//    //   final colors = await ColorExtractor.getColorsFromBytes(bytes);
//    //
//    //   final colorAverager = ColorAverager();
//    //   final averageColor = colorAverager.average(colors);
//    //
//    //   setState(() {
//    //     _averageColor = averageColor;
//    //   });
//    // }
//    //
//    CaptureAphoto() async{
//      final  photo = await picker.pickImage(source: ImageSource.camera);
//       setState(() {
//         _image=photo;
//       });
//
//      // if (_image != null) {
//      //   _calculateAverageColor(File(_image!.path));
//      // }
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body:Center(
//         child: SingleChildScrollView(
//           child: Column(
//             //mainAxisAlignment:  MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   ColorExtractor(boundaryKey: boundaryKey, child: CircleAvatar(
//                     radius: 100,
//                     backgroundImage: _image== null ? null : Image.file(File(_image!.path)).image,
//                   ), ),
//                   Padding(
//                     padding: const EdgeInsets.all(50),
//                     child: ColorAverager(
//                       boundaryKey: boundaryKey,
//                       controller: _controller,
//                       child: SizedBox(),
//                       onChanged: (value)  {
//
//                         print(value);
//
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Text("Take a photo"),
//                IconButton(
//                  icon: Icon(Icons.camera_alt_outlined),
//                  onPressed: CaptureAphoto,
//                ),
//               IconButton(
//                 icon: Icon(Icons.color_lens_outlined),
//                 onPressed: () async{
//                 final temp =await _controller.calculateAvgColor();
//                   log(temp.toString());
//                 },
//               ),
//               _averageColor == null
//                   ? Container()
//                   : Container(
//                 width: 100,
//                 height: 100,
//                 color: _averageColor,
//               ),
//
//             ],
//           ),
//         ),
//       ) ,
//     );
//   }
// }
