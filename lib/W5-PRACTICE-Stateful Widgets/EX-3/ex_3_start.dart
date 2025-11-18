import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner:
        false, // Why this line ? Can you explain it ? | To hide the debug banner when we load into debug mode
    home: DynamicGallery(images: images),
  ),
);

class DynamicGallery extends StatefulWidget {
  final List<String> images;
  const DynamicGallery({super.key, required this.images});

  @override
  State<DynamicGallery> createState() => _DynamicGalleryState();
}

class _DynamicGalleryState extends State<DynamicGallery> {
  int currentIndex = 0;
  void nextImage() => setState(() {
    currentIndex = (currentIndex + 1) % widget.images.length;
  });
  void prevImage() => setState(() {
    currentIndex =
        (currentIndex - 1 + widget.images.length) % widget.images.length;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: prevImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(widget.images[currentIndex]),
    );
  }
}
