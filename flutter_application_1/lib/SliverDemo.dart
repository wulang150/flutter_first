import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('SliverDemo1')),
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: const Text("SliverDemo"),
            pinned: true, // 滑动到顶端时会固定住
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverDemo'),
              background: Image.asset("images/ai_face_img_1.png",fit: BoxFit.cover),
            ),
          ),
          const SliverGridViewDemo(),
        ],
      ),
    );
  }
}

class SliverGridViewDemo extends StatelessWidget {
  const SliverGridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            color: Color.fromARGB(255, 85, 79, 79),
            alignment: Alignment(0.0, 0.0),
            child: Text(
              posts[index].name,
              style: TextStyle(fontSize: 14),
            ),
          );
        }, childCount: posts.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0));
  }
}
