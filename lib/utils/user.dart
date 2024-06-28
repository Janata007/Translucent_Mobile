class User {
  String firstName;
  String lastName;
  String email;
  String username;

  User(this.firstName, this.lastName, this.email, this.username);

  // named constructor
  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        username = json['username'];
}
