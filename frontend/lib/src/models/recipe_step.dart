
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