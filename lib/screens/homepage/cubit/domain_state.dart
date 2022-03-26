part of 'domain_cubit.dart';

@immutable
abstract class DomainState {}

class DomainInitial extends DomainState {}

class DomainFetching extends DomainState {}

class DomainFetched extends DomainState {
  List<DomainModel> data;
  DomainFetched(this.data);
}

class DomainInsert extends DomainState {}

class DomainInsertSuccess extends DomainState {}

class DomainInsertFailure extends DomainState {}

class DomainRemove extends DomainState {}

class DomainRemoveSuccess extends DomainState {}

class DomainRemoveFailure extends DomainState {}
