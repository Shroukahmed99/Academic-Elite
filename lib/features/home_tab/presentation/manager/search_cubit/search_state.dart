part of 'search_cubit.dart';

class SearchState {
  const SearchState({
    required this.recentSearches,
    required this.popularSearches,
  });

  final List<String> recentSearches;
  final List<String> popularSearches;
}
