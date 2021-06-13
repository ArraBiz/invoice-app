import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class DatabaseRepository {
  DatabaseRepository();

  Future<Store> fetchStore() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Store store = Store(getObjectBoxModel(), directory: join(dir.path, 'db'));
    return store;
  }
}
