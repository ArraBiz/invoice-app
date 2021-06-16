import 'package:invoice/models/customer.dart';
import 'package:invoice/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class CustomerRepository {
  CustomerRepository();

  Stream<List<Customer>> getAll(Store store) {
    QueryBuilder<Customer> queryBuilder = store.box<Customer>().query();
    queryBuilder.order(Customer_.name);
    return queryBuilder
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  Stream<List<Customer>> search(Store store, String value) {
    QueryBuilder<Customer> queryBuilder = store.box<Customer>().query(
        Customer_.name.contains(value).or(Customer_.mobile.contains(value)));
    queryBuilder.order(Customer_.name);

    return queryBuilder
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  void create(Store store, Customer customer) {
    final customerBox = store.box<Customer>();
    customerBox.put(customer);
  }

  void update(Store store, Customer customer) {
    final customerBox = store.box<Customer>();
    customerBox.put(customer, mode: PutMode.update);
  }

  void delete(Store store, int id) {
    final customerBox = store.box<Customer>();
    customerBox.remove(id);
  }
}
