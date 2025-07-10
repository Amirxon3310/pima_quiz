abstract class AuthEvent {}

class ChangePageViewCurrentIndex extends AuthEvent {
  final int index;

  ChangePageViewCurrentIndex({required this.index});
}
