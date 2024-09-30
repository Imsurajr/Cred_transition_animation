class HomeModel {
  bool isGridView = false;  // Here, false means list view, true means grid view

  void toggleView() {
    isGridView = !isGridView;
  }
}
