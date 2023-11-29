import 'dart:io';

import 'package:drift/drift.dart';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:finnote/model/cateogory.dart';
import 'package:finnote/model/transaction.dart';
import 'package:finnote/model/transaction_wirh_category.dart';

part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables: [Categories, Transactions],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  // CRUD Category
  Future<List<Category>> getAllCategoryRepo(int type) async {
    return await (select(categories)..where((tbl) => tbl.type.equals(type)))
        .get();
  }

  Future updateCategoryRepo(int id, String newName) async {
    return (update(categories)..where((t) => t.id.equals(id))).write(
      CategoriesCompanion(
        name: Value(newName),
      ),
    );
  }

  Future deleteCategoryRepo(int id) async {
    return (delete(categories)..where((t) => t.id.equals(id))).go();
  }

  // CRUD Transaction
  Stream<List<TransactionWithCategory>> getTransactionByDateRepo(
      DateTime date) {
    final query = (select(transactions).join([
      innerJoin(categories, categories.id.equalsExp(transactions.category_id))
    ])
      ..where(transactions.transaction_date.equals(date)));
    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCategory(
          row.readTable(transactions),
          row.readTable(categories),
        );
      }).toList();
    });
  }

  Future updateTransactionRepo(int id, int amount, int categoryId,
      DateTime transactionDate, String nameDescription) async {
    return (update(transactions)..where((t) => t.id.equals(id))).write(
      TransactionsCompanion(
          description: Value(nameDescription),
          amount: Value(amount),
          category_id: Value(categoryId),
          transaction_date: Value(transactionDate)),
    );
  }

  Future deleteTransactionRepo(int id) async {
    return (delete(transactions)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
