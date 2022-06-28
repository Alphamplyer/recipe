
class RecipeStep {
  final int? id;
  final int? recipeId;
  final int number;
  final String content;

  RecipeStep({
    this.id,
    this.recipeId,
    required this.number,
    required this.content,
  });

  RecipeStep copyWith({
    int? id,
    int? recipeId,
    int? number,
    String? content,
  }) {
    return RecipeStep(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      number: number ?? this.number,
      content: content ?? this.content,
    );
  }

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      number: json['number'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
      'number': number,
      'content': content,
    };
  }
}