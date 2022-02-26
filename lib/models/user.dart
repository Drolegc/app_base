import 'package:only_sugar_admin/models/models.dart';

/**
 * Modify this class deleting the role class if this app is not beeing use for an admin app
 * */
class User {
    String email;
    int id;
    Multimedia? profilePicture;
    Role role;
    String username;

    User({required this.email,required this.id, this.profilePicture,required this.role,required this.username});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            email: json['email'], 
            id: json['id'], 
            profilePicture: json['profilePicture'] != null ? Multimedia.fromJson(json['profilePicture']) : null,
            role: Role.fromJson(json['role']),
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['username'] = this.username;
        /*if (this.profilePicture != null) {
            data['profilePicture'] = this.profilePicture.toJson();
        }*/
        data['role'] = this.role.toJson();

        return data;
    }
}