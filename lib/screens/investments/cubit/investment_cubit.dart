import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_tracker/models/investment.dart';
import 'package:money_tracker/screens/investments/repo/investment_repo.dart';

part 'investment_state.dart';

class InvestmentCubit extends Cubit<InvestmentState> {
  String domain;
  InvestmentRepo investmentRepo = InvestmentRepo();
  InvestmentCubit(this.domain) : super(InvestmentInitial()) {
    fetchInvestments(domain);
  }

  fetchInvestments(String domain) async {
    emit(InvestmentFetching());
    List<InvestmentModel> investments =
        await investmentRepo.fetchInvestments(domain);
    emit(InvestmentFetched(investments));
  }

  addInvestment(String domain, double amount) {
    emit(InvestmentInsert());
    try {
      investmentRepo.addInvestment(domain, amount).then(
            (value) => emit(
              InvestmentInsertSuccess(),
            ),
          );
    } catch (e) {
      emit(InvestmentInsertFailure());
    }
  }
}
