import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(
          const SearchState(
            recentSearches: [
              'ايفون 14 برو',
              'ماك بوك اير',
              'كاميرا سوني',
            ],
            popularSearches: [
              'PS5',
              'آيباد برو',
              'بلايستيشن',
              'Nintendo سويتش',
              'كانون إي أو إس آر 6',
            ],
          ),
        );

  final searchController =
      TextEditingController();

  void removeRecentSearch(
    String item,
  ) {
    final recent =
        List<String>.from(
          state.recentSearches,
        );

    recent.remove(item);

    emit(
      SearchState(
        recentSearches: recent,
        popularSearches:
            state.popularSearches,
      ),
    );
  }

  void addRecentSearch(
    String value,
  ) {
    if (value.trim().isEmpty) return;

    final recent =
        List<String>.from(
          state.recentSearches,
        );

    recent.remove(value);

    recent.insert(
      0,
      value,
    );

    emit(
      SearchState(
        recentSearches: recent,
        popularSearches:
            state.popularSearches,
      ),
    );
  }

  void clearRecentSearches() {
    emit(
      SearchState(
        recentSearches: const [],
        popularSearches:
            state.popularSearches,
      ),
    );
  }

  void selectPopularSearch(
    String value,
  ) {
    searchController.text = value;

    addRecentSearch(value);
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}