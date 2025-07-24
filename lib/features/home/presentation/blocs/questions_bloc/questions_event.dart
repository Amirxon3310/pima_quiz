abstract class QuestionsEvent {}

class LoadQuestionsByCategoryEvent extends QuestionsEvent {
  final String categoryId;
  LoadQuestionsByCategoryEvent(this.categoryId);
}
