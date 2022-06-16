
class Tool {
  final String name;
  final String imageUrl;

  Tool({
    required this.name,
    required this.imageUrl,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}