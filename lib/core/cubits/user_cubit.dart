import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/models/user.dart';

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  setUser(User user) => emit(user);
  removeUser() => emit(null);
}
