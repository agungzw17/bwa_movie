import 'package:bwa_movie/models/models.dart';
import 'package:bwa_movie/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      UserModel userModel = await UserServices.getUser(event.id);

      emit(UserLoaded(userModel));
    });
    on<SignOut>((event, emit) {
      emit(UserInitial());
    });
    on<UpdateData>((event, emit) async {
      UserModel updatedUser = (state as UserLoaded)
          .userModel
          .copyWith(name: event.name, profilePicture: event.profileImage);

      await UserServices.updateUser(updatedUser);

      emit(UserLoaded(updatedUser));
    });
    on<TopUp>((event, emit) async {
      if (state is UserLoaded) {
        try {
          UserModel updatedUser = (state as UserLoaded).userModel.copyWith(
              balance: (state as UserLoaded).userModel.balance! + event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });
    on<Purchase>((event, emit) async {
      if (state is UserLoaded) {
        try {
          UserModel updatedUser = (state as UserLoaded).userModel.copyWith(
              balance: (state as UserLoaded).userModel.balance! - event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });
  }

  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is LoadUser) {
  //     UserModel userModel = await UserServices.getUser(event.id);
  //
  //     yield UserLoaded(userModel);
  //   } else if (event is SignOut) {
  //     yield UserInitial();
  //   } else if (event is UpdateData) {
  //     UserModel updatedUser = (state as UserLoaded)
  //         .userModel
  //         .copyWith(name: event.name, profilePicture: event.profileImage);
  //
  //     await UserServices.updateUser(updatedUser);
  //
  //     yield UserLoaded(updatedUser);
  //   } else if (event is TopUp) {
  //     if (state is UserLoaded) {
  //       try {
  //         UserModel updatedUser = (state as UserLoaded).userModel.copyWith(
  //             balance: (state as UserLoaded).userModel.balance! + event.amount);
  //
  //         await UserServices.updateUser(updatedUser);
  //
  //         yield UserLoaded(updatedUser);
  //       } catch (e) {
  //         print(e);
  //       }
  //     }
  //   } else if (event is Purchase) {
  //     if (state is UserLoaded) {
  //       try {
  //         UserModel updatedUser = (state as UserLoaded).userModel.copyWith(
  //             balance: (state as UserLoaded).userModel.balance! - event.amount);
  //
  //         await UserServices.updateUser(updatedUser);
  //
  //         yield UserLoaded(updatedUser);
  //       } catch (e) {
  //         print(e);
  //       }
  //     }
  //   }
  // }
}
