import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileDemo1 extends StatelessWidget {
  const FileDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}


class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int filecounter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$filecounter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;


  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;
  int _filecounter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _filecounter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _filecounter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_filecounter);
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Использование Файлов 3'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(width: 300, height: 100, child:
          ElevatedButton(onPressed: _incrementCounter,
            child: Text(
              'Кнопка Файла нажата $_filecounter раз${_filecounter == 1 ? '' : 's'}.',
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF0079D0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
              ),
            ),
          )
          ),

          const SizedBox(height: 100,),
          const Text(
            'Вы нажали на кнопку:',
          ),
          Text(
            '$_counter раз', //$_counter
            style: Theme.of(context).textTheme.headline4,
          ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter1,
        tooltip: 'Increment',
        child: const Icon(
            Icons.add),
      ),
    );
  }
}

