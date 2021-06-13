import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/repositories/database_repository.dart';
import 'package:objectbox/objectbox.dart';

final fetchStoreProvider = FutureProvider((ref) async => await DatabaseRepository().fetchStore());
final storeProvider = StateProvider((ref) => ref.read(fetchStoreProvider).data?.value);