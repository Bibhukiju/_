
import 'package:blog_app/route_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'modules/auth/presentations/bloc/auth_cubit.dart';
import 'modules/auth/presentations/screens/auth_screen.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl.call<AuthCubit>())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
        onGenerateRoute: RouteHandler.generateRoute,
      ),
    );
  }
}



// class MyQuillEditor extends StatefulWidget {
//   const MyQuillEditor({super.key});

//   @override
//   MyQuillEditorState createState() => MyQuillEditorState();
// }

// class MyQuillEditorState extends State<MyQuillEditor> {
//   final quill.QuillController _controller = quill.QuillController.basic();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quill Editor'),
//       ),
//       body: ListView(
//         children: [
//           quill.QuillToolbar.simple(
//               configurations: quill.QuillSimpleToolbarConfigurations(
//                   controller: _controller)),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: quill.QuillEditor.basic(
//               scrollController: ScrollController(),
//               focusNode: FocusNode(),
//               configurations: quill.QuillEditorConfigurations(
//                 padding: const EdgeInsets.all(8),
//                 scrollable: true,
//                 autoFocus: true,
//                 expands: false,
//                 placeholder: 'Add your data here...',
//                 controller: _controller,
//                 elementOptions: const quill.QuillEditorElementOptions(),
//               ),
//             ),
//           ),
//           TextButton(
//               onPressed: () {
//                 List deltaJson = _controller.document.toDelta().toJson();
//                 log(DeltaToHTML.encodeJson(deltaJson));
//               },
//               child: const Text("hello"))
//         ],
//       ),
//     );
//   }
// }
