import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:money_tracker/models/domain.dart';
import 'package:money_tracker/screens/homepage/repo/domain_repo.dart';

part 'domain_state.dart';

class DomainCubit extends Cubit<DomainState> {
  DomainRepo repo = DomainRepo();
  DomainCubit() : super(DomainInitial()) {
    fetchDomains();
  }

  fetchDomains() async {
    emit(DomainFetching());
    List<DomainModel> data = await repo.fetchDomains();
    emit(DomainFetched(data));
  }

  addDomain(String domain) async {
    emit(DomainInsert());
    try {
      await repo.addDomain(domain);
      emit(DomainInsertSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(DomainInsertFailure());
    }
  }

  removeDomain(String domain) {
    emit(DomainRemove());
    try {
      repo.removeDomain(domain);
      emit(DomainRemoveSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(DomainRemoveFailure());
    }
  }
}
