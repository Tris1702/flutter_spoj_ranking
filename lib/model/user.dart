// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String username;
  int target;
  int current;
  User({
    required this.username,
    required this.target,
    required this.current,
  });

  User copyWith({
    String? username,
    int? target,
    int? current,
  }) {
    return User(
      username: username ?? this.username,
      target: target ?? this.target,
      current: current ?? this.current,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'target': target,
      'current': current,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      target: map['target'] as int,
      current: map['current'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(username: $username, target: $target, current: $current)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.username == username &&
      other.target == target &&
      other.current == current;
  }

  @override
  int get hashCode => username.hashCode ^ target.hashCode ^ current.hashCode;
}
