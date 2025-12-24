class ResetPasswordRequest {

  final String? email;

  final String? newPassword;

  ResetPasswordRequest ({
    this.email,
    this.newPassword,
  });



  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "newPassword": newPassword,
    };
  }
}


