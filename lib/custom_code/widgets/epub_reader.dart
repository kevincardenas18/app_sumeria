// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:epub_view/epub_view.dart';
import 'package:universal_file/universal_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EpubReader extends StatefulWidget {
  const EpubReader({
    Key? key,
    this.width,
    this.height,
    required this.assetPath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String assetPath;

  @override
  State<EpubReader> createState() => _EpubReaderState();
}

class _EpubReaderState extends State<EpubReader> {
  late EpubController _epubController;
  double _fontSize = 16.0;
  List<String> _bookmarks = [];

  @override
  void initState() {
    super.initState();
    _epubController = EpubController(
      document: EpubDocument.openFile(File(widget.assetPath)),
    );
    _loadBookmarks();
  }

  @override
  void dispose() {
    _epubController.dispose();
    super.dispose();
  }

  void _changeFontSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(12.0, 24.0);
    });
  }

  void _showTableOfContents(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: EpubViewTableOfContents(controller: _epubController),
      ),
    );
  }

  void _addBookmark(BuildContext context) async {
    final cfi = _epubController.generateEpubCfi();
    if (cfi != null && !_bookmarks.contains(cfi)) {
      setState(() {
        _bookmarks.add(cfi);
      });
      await _saveBookmarks();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Marcador añadido: $cfi'),
          action: SnackBarAction(
            label: 'GO',
            onPressed: () {
              _epubController.gotoEpubCfi(cfi);
            },
          ),
        ),
      );
    }
  }

  void _showBookmarks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: _bookmarks.length,
          itemBuilder: (context, index) {
            final cfi = _bookmarks[index];
            return ListTile(
              title: Text('Marcapágina ${index + 1}'),
              subtitle: Text(cfi),
              onTap: () {
                Navigator.pop(context);
                _epubController.gotoEpubCfi(cfi);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
          controller: _epubController,
          builder: (chapterValue) => Text(
            chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bookmark_add),
            onPressed: () => _addBookmark(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: EpubViewTableOfContents(controller: _epubController),
      ),
      body: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            Expanded(
              child: EpubView(
                builders: EpubViewBuilders<DefaultBuilderOptions>(
                  options: DefaultBuilderOptions(
                    textStyle: TextStyle(
                      fontSize: _fontSize,
                      color: textColor,
                    ),
                  ),
                  chapterDividerBuilder: (_) => const Divider(),
                ),
                controller: _epubController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_decrease),
            label: 'Disminuir Fuente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_increase),
            label: 'Aumentar Fuente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Contenidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: 'Marcadores',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              _changeFontSize(-1);
              break;
            case 1:
              _changeFontSize(1);
              break;
            case 2:
              _showTableOfContents(context);
              break;
            case 3:
              _showBookmarks(context);
              break;
          }
        },
      ),
    );
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonBookmarks = jsonEncode(_bookmarks);
    await prefs.setString('marcapáginas', jsonBookmarks);
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonBookmarks = prefs.getString('marcapáginas');
    if (jsonBookmarks != null) {
      setState(() {
        _bookmarks = (jsonDecode(jsonBookmarks) as List).cast<String>();
      });
    }
  }
}
