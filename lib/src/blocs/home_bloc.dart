import 'package:kloverseries_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kloverseries_app/src/models/item_model.dart';

class HomeBloc {
  final _repository = Repository();
  final _homeFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allHomeData => _homeFetcher.stream;

  fetchAllHomeData() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _homeFetcher.sink.add(itemModel);
  }

  dispose() {
    _homeFetcher.close();
  }
}

final bloc = HomeBloc();