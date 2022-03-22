part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final List<News> news;
  const NewsLoaded(this.news);
  @override
  List<Object> get props => [news];
}

class SuccessfullyBookmark extends NewsState {
  @override
  List<Object> get props => [];
}

class FailedToBookmark extends NewsState {
  @override
  List<Object> get props => [];
}

class SuccessfullyRemovedBookmark extends NewsState {
  @override
  List<Object> get props => [];
}

class FailedToRemoveBookmark extends NewsState {
  @override
  List<Object> get props => [];
}
