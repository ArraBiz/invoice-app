import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/application/store_notifier.dart';
import 'package:invoice/repositories/database_repository.dart';

final databaseRepositoryProvider =
    Provider<DatabaseRepository>((ref) => DatabaseRepository());

final storeNotifierProvider = StateNotifierProvider(
    (ref) => StoreNotifier(ref.watch(databaseRepositoryProvider)));
