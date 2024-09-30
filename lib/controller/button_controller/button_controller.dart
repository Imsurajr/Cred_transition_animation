import '../../model/buttons/buttons.dart';

class HomeController {
  final HomeModel _model;

  HomeController(this._model);

  bool get isGridView => _model.isGridView;

  void toggleView() {
    _model.toggleView();
  }
}
