import 'package:bloc/bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerInitial(dateData: 'Due Date'));
  showDate(String newValue) {
    state.dateData = newValue;
    emit(DatePickerState(dateData: state.dateData));
  }
}
