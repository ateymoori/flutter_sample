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

  String getAvailability() {
    if (trainer.isAvailable)
      return "Available";
    else
      return 'Not Available';
  }

  TextStyle _titleStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  }

  TextStyle _detailsStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  }

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
          Card(
            elevation: 10,
            child: Container(
                padding: const EdgeInsetsDirectional.only(
                    start: 14, end: 14, bottom: 7, top: 7),
                child: Column(
                  children: [
                    _buildTrainerTitleAndDate(),
                    _buildTags(),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainerTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(trainer.name.first + ' ' + trainer.name.last,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),
          Row(children: [
            Text("Availability : ", style: _titleStyle()),
            Text(getAvailability(), style: _detailsStyle()),
          ]),
          Row(children: [
            Text("Email : ", style: _titleStyle()),
            Text(trainer.email, style: _detailsStyle()),
          ]),
          Row(children: [
            Text("Favorite Fruit : ", style: _titleStyle()),
            Text(trainer.favoriteFruit, style: _detailsStyle()),
          ]),
          Row(children: [
            // Text("About : ", style: _titleStyle()),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About : ", style: _titleStyle()),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(trainer.about),
                  ),
                ],
              ),
            )
          ])
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

  Widget _buildTags() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: trainer.tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _buildTagBox(index),
      ),
    );
  }

  Widget _buildTagBox(int index) => Container(
      child: Card(
          color: Colors.green,
          elevation: 4,
          margin: EdgeInsets.all(4),
          child: Padding(
            padding: EdgeInsets.all( 6.0),
            child: Text(trainer.tags[index],
                style: TextStyle(color: Colors.white, fontSize: 17)),
          )));

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
