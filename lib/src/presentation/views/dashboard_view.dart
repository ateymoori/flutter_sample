import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/presentation/widgets/trainer_widget.dart';
import '../../core/bloc/bloc_with_state.dart';
import '../../domain/entities/trainer.dart';
import '../blocs/remote_trainers/remote_trainers_bloc.dart';
import '../widgets/trainer_widget.dart';

class DashboardView extends HookWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scrollController = useScrollController();

    // useEffect(() {
    //   scrollController
    //       .addListener(() => _onScrollListener(context, scrollController));
    //   return scrollController.dispose;
    // },
    //     [scrollController]);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }


  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 4.0,
      title: const Text('Lepaya', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody( ) {
    return BlocBuilder<RemoteTrainersBloc, RemoteTrainersState>(
      builder: (_, state) {
        if (state is RemoteTrainersLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteTrainersError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteTrainersDone) {
          return _buildTrainer( state.trainers);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTrainer(  List<Trainer> trainers) {
    return ListView(
      controller:   ScrollController(),
      children: [
        // Items
        ...List<Widget>.from(
          trainers.map(
            (e) => Builder(
              builder: (context) => TrainerWidget(
                trainer: e,
                onTrainerPressed: (e) => _onTrainerPressed(context, e),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: CupertinoActivityIndicator(),
        ),
      ],
    );
  }


  void _onTrainerPressed(BuildContext context, Trainer trainer) {
    Navigator.pushNamed(context, '/TrainerDetailsView', arguments: trainer);
  }

}
