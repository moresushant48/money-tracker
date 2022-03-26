import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'domain_state.dart';

class DomainCubit extends Cubit<DomainState> {
  DomainCubit() : super(DomainInitial());
}
