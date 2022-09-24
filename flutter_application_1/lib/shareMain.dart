// ignore: file_names
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ShareMain extends StatelessWidget{
  const ShareMain({super.key});

  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: const Text('share')),
      body: Center(
        child: Text(wordPair.toString()),
      ),
    );
  }

}