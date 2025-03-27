class User{

  final String email;
  final String username;
  final String uid;
  final int credits;
  final List vehicles;

  const User({
    required this.email,
    required this.username,
    required this.uid,
    required this.credits,
    required this.vehicles,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'username':username,
    'uid':uid,
    'credits':credits,
    'vehicles':vehicles,
  };

}