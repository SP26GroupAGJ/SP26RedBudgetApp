class TransactionCardEntity {
  String category;
  String? description;
  DateTime date;
  double amount;
  String id;

  TransactionCardEntity(
      {required this.category,
      required this.amount,
      required this.date,
      required this.id});
}
