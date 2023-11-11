import 'package:bloc/bloc.dart';

part 'update_list_state.dart';

class UpdateListCubit extends Cubit<UpdateListState> {
  UpdateListCubit() : super(UpdateListInitial(date: 'Pick a new Date'));
  setaNewDate(value) {
    state.date = value;
    emit(UpdateListState(date: state.date));
  }
}
