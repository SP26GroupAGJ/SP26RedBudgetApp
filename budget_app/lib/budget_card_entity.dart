class BudgetCardEntity {
  String category;
  String? description;
  int interval;
  int startDate;
  double total;
  String? id;

  BudgetCardEntity(
      {required this.category,
      required this.total,
      required this.interval,
      required this.startDate,
      this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['interval'] = this.interval;
    data['startDate'] = this.startDate;
    data['amount'] = this.total;
    data['id'] = this.id;
    return data;
  }

  BudgetCardEntity.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        description = json['description'],
        interval = json['interval'],
        startDate = json['startDate'],
        total = json['total'],
        id = json['id'];
}
