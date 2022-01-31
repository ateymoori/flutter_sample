import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';
import '../../injector.dart';

class TrainerDetailsView extends HookWidget {
  final Trainer trainer;

  const TrainerDetailsView({Key key, this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<RemoteTrainersBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
            color: Colors.green,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
      backgroundColor: Colors.grey.shade100,
      elevation: 4.0,
      title: Text(trainer.name.first + ' ' + trainer.name.last,
          style: TextStyle(color: Colors.black)),
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTrainerImage(),
          _buildTrainerTitleAndDate(),
          _buildTrainerDescription(),
       //   _buildTags(),
        ],
      ),
    );
  }

  Widget _buildTrainerTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            trainer.name.first + ' ' + trainer.name.last,
            style: const TextStyle(
                fontFamily: 'IBM', fontSize: 20, fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 14),
          // DateTime
          Row(
            children: [
              const Icon(Ionicons.time_outline, size: 16),
              const SizedBox(width: 4),
              Text(
                trainer.email,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrainerImage() {
    return Container(
      width: double.maxFinite,
      height: 300,
      margin: const EdgeInsets.only(top: 1),
      child: Image.network(trainer.picture, fit: BoxFit.fitHeight),
    );
  }

  Widget _buildTrainerDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${trainer.picture ?? ''}\n\n${trainer.email ?? ''}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  // Widget _buildTags() {
  //   return ListView(
  //     // This next line does the trick.
  //     scrollDirection: Axis.horizontal,
  //     children: <Widget>[
  //       Container(
  //         width: 50.0,
  //         color: Colors.red,
  //       ),
  //       Container(
  //         width: 60.0,
  //         color: Colors.blue,
  //       ),
  //       Container(
  //         width: 160.0,
  //         color: Colors.green,
  //       ),
  //       Container(
  //         width: 160.0,
  //         color: Colors.yellow,
  //       ),
  //       Container(
  //         width: 160.0,
  //         color: Colors.orange,
  //       ),
  //     ],
  //   );
  // }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
