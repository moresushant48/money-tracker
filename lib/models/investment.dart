class InvestmentModel {
  late double amount;
  late String date;

  InvestmentModel({required this.amount, required this.date});

  InvestmentModel.fromJson(Map<dynamic, dynamic> data) {
    amount = data['amount'].toDouble();
    date = data['date'];
  }

  toJson() {
    return {
      "amount": amount,
      "date": date,
    };
  }
}
