import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/exception/api_exception.dart';
import 'package:news_app/core/utils/logger.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/inews_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final INewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsLoading());
  final log = logger(NewsCubit);

  Future<void> headLines() async {
    try {
      final news = await newsRepository.headlines();
      log.i(news.length);
      emit(NewsLoaded(news));
    } on NetwrokException {
      log.e('network');
    } on InvalidFormatException {
      log.e('invalid format');
    } on NoDataException {
      log.w('no data');
    } catch (e) {
      log.e(e);
    }
  }

  Future<void> categoryNews(NewsCategory category) async {
    try {
      final news = await newsRepository.categoryNews(category);

      emit(NewsLoaded(news));
    } on NetwrokException {
      log.e('network');
    } on InvalidFormatException {
      log.e('invalid format');
    } on NoDataException {
      log.w('no data');
    } catch (e) {
      log.e(e);
    }
  }

  Future<void> bookmarkNews(News news) async {
    final result = await newsRepository.bookmark(news);
    if (result) {
      emit(SuccessfullyBookmark());
      return;
    }
    emit(FailedToBookmark());
  }

  Future<void> removeFromBookmark(int id) async {
    final result = await newsRepository.removeBookmark(id);
    if (result) {
      emit(SuccessfullyRemovedBookmark());
      return;
    }
    emit(FailedToRemoveBookmark());
  }
}
