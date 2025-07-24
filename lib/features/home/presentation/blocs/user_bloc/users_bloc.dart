import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_users_usecase.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase useCase;
  List<UsersEntity> _allUsers = [];

  UsersBloc(this.useCase) : super(UsersInitial()) {
    on<LoadUsersEvent>(_onLoadUsers);

    on<SearchUsersEvent>(
      _onSearchUsers,
      transformer: _debounce<SearchUsersEvent>(),
    );
  }

  /// Debounce transformer (300ms)
  EventTransformer<T> _debounce<T>() {
    return (events, mapper) => events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(mapper);
  }

  Future<void> _onLoadUsers(
      LoadUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      // final users = await useCase();
      final users = await useCase.getOrderedUsers();
      _allUsers = users;
      emit(UsersLoaded(
        originalUsersList: users,
        filteredUsersList: users,
      ));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  void _onSearchUsers(SearchUsersEvent event, Emitter<UsersState> emit) {
    emit(UsersSearching());

    final query = event.query.trim().toLowerCase();
    final filtered = query.isEmpty
        ? _allUsers
        : _allUsers
            .where((user) => user.name.toLowerCase().contains(query))
            .toList();

    emit(UsersLoaded(
      originalUsersList: _allUsers,
      filteredUsersList: filtered,
    ));
  }
}
