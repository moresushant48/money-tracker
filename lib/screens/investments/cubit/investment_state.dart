part of 'investment_cubit.dart';

@immutable
abstract class InvestmentState {}

class InvestmentInitial extends InvestmentState {}

class InvestmentFetching extends InvestmentState {}

class InvestmentFetched extends InvestmentState {
  List<InvestmentModel> investments;
  InvestmentFetched(this.investments);
}

class InvestmentInsert extends InvestmentState {}

class InvestmentInsertSuccess extends InvestmentState {}

class InvestmentInsertFailure extends InvestmentState {}

class InvestmentRemove extends InvestmentState {}

class InvestmentRemoveSuccess extends InvestmentState {}

class InvestmentRemoveFailure extends InvestmentState {}
