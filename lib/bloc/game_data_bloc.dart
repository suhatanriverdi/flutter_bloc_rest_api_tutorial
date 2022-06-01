import 'package:bloc/bloc.dart';
import 'package:bloc_api/models/data_model.dart';
import 'package:bloc_api/repository/games_repo.dart';
import 'package:meta/meta.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GamesRepository gamesRepo;

  GameDataBloc(this.gamesRepo) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<DataModel>? apiResult = await gamesRepo.getGamesData();
        if (apiResult == null) {
          emit(GameDataErrorState());
        } else {
          emit(GameDataLoadedState(apiResult));
        }
      }
    });
  }
}
