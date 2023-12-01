import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:login2/data/datasources/api_datasources.dart';
import 'package:login2/data/models/request/register_model.dart';
import 'package:login2/data/models/response/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiDatasources datasources;
  RegisterBloc(
    this.datasources,
  ) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final result = await datasources.register(event.request);
        print(result);
        emit(RegisterFinish(model: result));
      } catch (error) {
        print("Error: $error");
        // Handle error state or display an error message to the user.
      }
    });
  }
}
