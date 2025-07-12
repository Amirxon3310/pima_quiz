// lib/features/banners/presentation/bloc/banners_state.dart
import '../../../domain/entities/banner_entity.dart';

abstract class BannersState {}

class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersLoaded extends BannersState {
  final List<BannerEntity> banners;

  BannersLoaded(this.banners);
}

class BannersError extends BannersState {
  final String message;

  BannersError(this.message);
}
