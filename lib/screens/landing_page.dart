import 'package:bloc_api/bloc/game_data_bloc.dart';
import 'package:bloc_api/screens/game_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/data_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return Center(child: const CircularProgressIndicator());
          } else if (state is GameDataLoadingState) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is GameDataLoadedState) {
            return buildGameModel(width, height, state.apiResult);
          } else if (state is GameDataErrorState) {
            return const Text("ERROR!");
          }
          return const Text("SWENT WRONG!");
        },
      ),
    );
  }

  ListView buildGameModel(double height, double width, List<DataModel> games) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          final DataModel dataModel = games[index];
          return Padding(
            padding: EdgeInsets.only(
                bottom: width * 0.01, left: width * 0.01, right: width * 0.01),
            child: GameCard(
              dataModel: dataModel,
              heigth: height * 0.8,
              width: width * 0.45,
            ),
          );
        });
  }
}
