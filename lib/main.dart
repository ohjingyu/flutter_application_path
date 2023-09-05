import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic path = const Text('경로 위치');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  Directory? dir = await getExternalStorageDirectory();
                  setState(() {
                    var fileName = '${dir!.path}/test.txt';
                    path = Text(fileName);
                    File file = File(fileName);
                    var data = 'hello'; //{'name': 'leejunghwan', 'age': '41'};
                    file.writeAsStringSync(data);
                  });
                },
                child: const Text("내용확인")),
            path
          ],
        ),
      ),
    );
  }
}
