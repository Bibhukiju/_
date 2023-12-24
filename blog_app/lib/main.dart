import 'dart:developer';

import 'package:delta_to_html/delta_to_html.dart';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyQuillEditor(),
    );
  }
}

class MyQuillEditor extends StatefulWidget {
  const MyQuillEditor({super.key});

  @override
  MyQuillEditorState createState() => MyQuillEditorState();
}

class MyQuillEditorState extends State<MyQuillEditor> {
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quill Editor'),
      ),
      body: ListView(
        children: [
          quill.QuillToolbar.simple(
              configurations: quill.QuillSimpleToolbarConfigurations(
                  controller: _controller)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: quill.QuillEditor.basic(
              scrollController: ScrollController(),
              focusNode: FocusNode(),
              configurations: quill.QuillEditorConfigurations(
                padding: const EdgeInsets.all(8),
                scrollable: true,
                autoFocus: true,
                expands: false,
                placeholder: 'Add your data here...',
                controller: _controller,
                elementOptions: const quill.QuillEditorElementOptions(),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                List deltaJson = _controller.document.toDelta().toJson();
                log(DeltaToHTML.encodeJson(deltaJson));
              },
              child: const Text("hello"))
        ],
      ),
    );
  }
}
