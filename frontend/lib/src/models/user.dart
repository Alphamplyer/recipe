
class User {
  final String id;
  final String username;

  final String? email;
  final String? thumbnailUrl;
  final String? bio;

  final String? instagramLink;
  final String? facebookLink;
  final String? twitterLink;
  final String? youtubeLink;
  final String? websiteLink;

  final String? createdAt;

  User({
    required this.id,
    required this.username,

    this.email,
    this.thumbnailUrl,
    this.bio,

    this.instagramLink,
    this.facebookLink,
    this.twitterLink,
    this.youtubeLink,
    this.websiteLink,

    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      thumbnailUrl: json['thumbnailUrl'],
      bio: json['bio'],
      instagramLink: json['instagramLink'],
      facebookLink: json['facebookLink'],
      twitterLink: json['twitterLink'],
      youtubeLink: json['youtubeLink'],
      websiteLink: json['websiteLink'],
      createdAt: json['createdAt'],
    );
  }
}