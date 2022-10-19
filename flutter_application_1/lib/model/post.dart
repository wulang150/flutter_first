
class Post {
  const Post({required this.name,required this.age});

  final String name;
  final String age;
}

const List<Post> posts = [
  Post(name: "xiaoming", age: "20"),
  Post(name: "dongping", age: "22"),
  Post(name: "xiaohong", age: "10"),
  Post(name: "tianyun", age: "28"),
];