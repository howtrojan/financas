import 'package:financas/common/models/models.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();

  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      TransactionModel(
          category: 'Salário',
          description: 'Salário mensal',
          value: 1400,
          date: DateTime.now().microsecondsSinceEpoch,
          status: true,
          createdAt: 02042024),
      TransactionModel(
          category: 'Cartão',
          description: 'Despesas com Cartão',
          value: -2500,
          date: DateTime.now().microsecondsSinceEpoch,
          status: true,
          createdAt: 02042024),
      TransactionModel(
          category: 'Vale',
          description: 'Vale do mês',
          value: 1000,
          date: DateTime.now().microsecondsSinceEpoch,
          status: true,
          createdAt: 02042024),
      TransactionModel(
          category: 'Água',
          description: 'Despesas de Água',
          value: -64,
          date: DateTime.now()
              .subtract(const Duration(days: 7))
              .microsecondsSinceEpoch,
          status: true,
          createdAt: 02042024),
    ];
  }
}
