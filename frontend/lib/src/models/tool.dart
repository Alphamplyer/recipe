
class Tool {
  final int? id;
  final String name;
  final String imageUrl;

  Tool({
    this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}