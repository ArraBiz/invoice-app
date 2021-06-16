import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/objectbox.g.dart';
import 'package:invoice/repositories/database_repository.dart';
import 'package:objectbox/objectbox.dart';

abstract class StoreState {
  const StoreState();
}

class StoreInitial extends StoreState {
  const StoreInitial();
}

class StoreLoading extends StoreState {
  const StoreLoading();
}

class StoreLoaded extends StoreState {
  final Store store;

  const StoreLoaded(this.store);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StoreLoaded && o.store == store;
  }

  @override
  int get hashCode => super.hashCode;

  Store get state => this.store;
}

class StoreError extends StoreState {
  final String message;

  const StoreError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StoreError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class StoreNotifier extends StateNotifier {
  final DatabaseRepository _databaseRepository;

  StoreNotifier(this._databaseRepository) : super(StoreInitial());

  Future<void> getStore() async {
    try {
      state = StoreLoading();
      final store = await _databaseRepository.fetchStore();
      state = StoreLoaded(store);
    } catch (e) {
      state = StoreError("Couldn't fetch store.");
    }
  }
}
