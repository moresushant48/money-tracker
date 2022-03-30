import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:money_tracker/models/investment.dart';

class InvestmentRepo {
  late FirebaseDatabase db;
  late FirebaseAuth auth;

  InvestmentRepo() {
    auth = FirebaseAuth.instance;
    db = FirebaseDatabase.instance;
  }

  getInvestmentUrl(String domain) {
    return "users/${auth.currentUser!.uid}/domains/$domain/";
  }

  fetchInvestments(String domain) async {
    DataSnapshot snap = await db.ref(getInvestmentUrl(domain)).get();
    List<InvestmentModel> investments = [];

    if (snap.value != null && snap.value != "") {
      Map<dynamic, dynamic> data = snap.value as Map;
      data.forEach((key, value) {
        print("$key and $value");
        investments.add(InvestmentModel.fromJson(value));
        // investments.add(InvestmentModel.fr);
      });
    }

    return investments;
  }

  Future<void> addInvestment(String domain, double amount) async {
    return await db.ref(getInvestmentUrl(domain)).push().set(
        InvestmentModel(amount: amount, date: DateTime.now().toString())
            .toJson());
  }

  // removeInvestment(String domain, InvestmentModel investment) {
  //   db.ref(getInvestmentUrl(domain)).
  // }
}
