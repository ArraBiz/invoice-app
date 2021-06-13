import 'package:objectbox/objectbox.dart';

@Entity()
class Customer {
  int id;
  String name;
  String email;
  String mobile;
  String address;

  Customer(
      {this.id = 0,
      required this.name,
      required this.email,
      required this.mobile,
      required this.address});
}
