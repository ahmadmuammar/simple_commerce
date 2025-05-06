class ParamsLogin {
  const ParamsLogin({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toMap() => {
        'username': username,
        'password': password,
      };
}
