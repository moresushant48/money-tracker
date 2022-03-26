part of 'domain_cubit.dart';

@immutable
abstract class DomainState {}

class DomainInitial extends DomainState {}

class DomainFetching extends DomainState {}

class DomainFetched extends DomainState {}
