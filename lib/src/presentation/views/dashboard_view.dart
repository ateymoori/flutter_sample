import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/presentation/widgets/trainer_widget.dart';

import '../../core/bloc/bloc_with_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/entities/trainer.dart';
import '../blocs/remote_articles/remote_articles_bloc.dart';
import '../blocs/remote_trainers/remote_trainers_bloc.dart';
import '../widgets/article_widget.dart';
import '../widgets/trainer_widget.dart';

class DashboardView extends HookWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Trainers List', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(ScrollController scrollController) {
    // return _buildArticle(scrollController);
    return BlocBuilder<RemoteTrainersBloc, RemoteTrainersState>(
      builder: (_, state) {
        if (state is RemoteTrainersLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteTrainersError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteTrainersDone) {
          return _buildArticle(scrollController, state.trainers );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildArticle(
    ScrollController scrollController,
    List<Trainer> trainers
  ) {
    return ListView(
      controller: scrollController,
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

        // add Loading (circular progress indicator at the end),
        // if there are more items to be loaded
        // if (false) ...[
        //   const SizedBox(),
        // ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: CupertinoActivityIndicator(),
          ),
        // ]
      ],
    );
  }

  void _onScrollListener(BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteTrainerBloc = BlocProvider.of<RemoteTrainersBloc>(context);
    final state = remoteTrainerBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      remoteTrainerBloc.add(const GetTrainers());
    }
  }

  void _onTrainerPressed(BuildContext context, Trainer trainer) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: trainer);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticlesView');
  }
}
