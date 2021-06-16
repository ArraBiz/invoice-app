import 'package:objectbox/objectbox.dart';

@Entity()
class Customer {
  int id;
  String name;
  String? email;
  String mobile; //TODO: make it unique
  String? address;

  Customer(
      {this.id = 0,
      required this.name,
      this.email,
      required this.mobile,
      this.address});
}
