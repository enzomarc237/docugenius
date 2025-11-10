class SearchService {
  Future<List<String>> search(String query) async {
    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 500));

    if (query.isEmpty) {
      return [];
    }

    // Return some dummy data
    return [
      'Result 1 for "$query"',
      'Result 2 for "$query"',
      'Result 3 for "$query"',
      'Result 4 for "$query"',
      'Result 5 for "$query"',
    ];
  }
}
