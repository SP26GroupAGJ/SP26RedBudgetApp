class TransactionCardEntity {
  String category;
  String? description;
  int date;
  double amount;
  String id;

  TransactionCardEntity(
      {required this.category,
      required this.amount,
      required this.date,
      required this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['id'] = this.id;
    return data;
  }

  TransactionCardEntity.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        description = json['description'],
        date = json['date'],
        amount = json['amount'],
        id = json['id'];
}
