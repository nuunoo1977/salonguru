abstract class CartSource {
  Future<Map<int, int>> load();
  Future<void> save(Map<int, int> items);
}
