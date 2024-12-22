import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/profile/data/models/profile_response_model.dart';
import 'package:task1intern/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  getProfileData() async {
    emit(ProfileLoading());
    //String token = await SharedPrefHelper.getString("token");
    final response = await profileRepo.getProfile();

    response.fold((failure) {
      emit(ProfileError(errorMessage: failure.errorMessage));
    }, (responseBody) {
      emit(ProfileLoaded(responseBody));
    });
  }
}
