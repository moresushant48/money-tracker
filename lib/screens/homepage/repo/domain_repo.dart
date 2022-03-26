import 'package:firebase_database/firebase_database.dart';
import 'package:money_tracker/models/domain.dart';

class DomainRepo {
  late FirebaseDatabase db;

  DomainRepo() {
    db = FirebaseDatabase.instance;
  }

  Future<List<DomainModel>> fetchDomains() async {
    DataSnapshot snap = await db.ref("users/sushant/").get();
    Map<dynamic, dynamic> data = snap.value as Map;
    List<DomainModel> domains = [];
    data.forEach((key, value) {
      domains.add(DomainModel(key));
    });
    return domains;
  }

  Future<void> addDomain(String domain) {
    return db.ref("users/sushant/").child(domain).set("");
  }

  removeDomain(String domain) {
    db.ref("users/sushant/").child(domain).remove();
  }
}
