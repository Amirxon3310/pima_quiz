// lib/features/banners/presentation/bloc/banners_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_banners_usecase.dart';
import 'banners_event.dart';
import 'banners_state.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  final GetBannersUseCase getBannersUseCase;

  BannersBloc(this.getBannersUseCase) : super(BannersInitial()) {
    on<LoadBannersEvent>((event, emit) async {
      emit(BannersLoading());
      try {
        final banners = await getBannersUseCase.call();
        emit(BannersLoaded(banners));
      } catch (e) {
        emit(BannersError(e.toString()));
      }
    });
  }
}
