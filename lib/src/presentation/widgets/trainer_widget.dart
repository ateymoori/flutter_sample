import 'package:flutter/material.dart';
import '../../domain/entities/trainer.dart';

class TrainerWidget extends StatelessWidget {
  final Trainer trainer;
  final void Function(Trainer trainer) onTrainerPressed;

  const TrainerWidget({
    Key key,
    this.trainer,
    this.onTrainerPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(),
      child: Card(
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 14, end: 14, bottom: 7, top: 7),
          height: MediaQuery.of(context).size.width / 3,
          child: Row(
            children: [_buildImage(context), _buildTitleAndDescription()],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: CircleAvatar(
        backgroundImage: NetworkImage(trainer?.picture),
        backgroundColor: Colors.green,
        radius: 40,
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              trainer.name.first + ' ' + trainer.name.last,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'IBM',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  trainer.email ?? '',
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (onTrainerPressed != null) {
      onTrainerPressed(trainer);
    }
  }
}
