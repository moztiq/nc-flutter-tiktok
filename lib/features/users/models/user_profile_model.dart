class UserProfileModel {
  final bool hasAvatar;
  final String uid;
  final String email;
  final String name;
  final String bio;
  final String link;

  UserProfileModel.empty()
      : hasAvatar = false,
        uid = '',
        email = '',
        name = '',
        bio = '',
        link = '';

  UserProfileModel({
    required this.hasAvatar,
    required this.uid,
    required this.email,
    required this.name,
    required this.bio,
    required this.link,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : hasAvatar = json['hasAvatar'],
        uid = json['uid'],
        email = json['uid'],
        name = json['name'],
        bio = json['bio'],
        link = json['link'];

  Map<String, dynamic> toJson() {
    return {
      "hasAvatar": hasAvatar,
      "uid": uid,
      "email": email,
      "name": name,
      "bio": bio,
      "link": link,
    };
  }

  UserProfileModel copyWith({
    bool? hasAvatar,
    String? uid,
    String? email,
    String? name,
    String? bio,
    String? link,
  }) {
    return UserProfileModel(
      hasAvatar: hasAvatar ?? this.hasAvatar,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      link: link ?? this.link,
    );
  }
}
