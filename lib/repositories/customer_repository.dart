import 'package:invoice/models/customer.dart';
import 'package:objectbox/objectbox.dart';

class CustomerRepository {
  CustomerRepository();

    Stream<List<Customer>> getAll(Store store) {
    Stream<List<Customer>> _stream = store
        .box<Customer>()
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());

    return _stream;
  }

  void create(Store store, Customer customer) {
    final customerBox = store.box<Customer>();
    customerBox.put(customer);
  }
}
