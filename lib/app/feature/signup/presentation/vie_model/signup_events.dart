sealed class SignupEvents {}
class SignupEvent extends SignupEvents{
    String username;
    String firstName;
    String lastName ;
    String email ;
    String password ;
    String rePassword ;
    String phone ;
    String gender;

    SignupEvent({
    this.username = "",
    this. firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
    this.phone = "",
    this.gender ="male"
    });
}