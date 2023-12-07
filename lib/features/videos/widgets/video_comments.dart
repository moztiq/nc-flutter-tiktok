import 'package:flutter/material.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class VideoComments extends StatelessWidget {
  const VideoComments({super.key});

  @override
  Widget build(BuildContext context) {
    void _onClosedPressed() {
      Navigator.of(context).pop();
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text('2274 comments'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _onClosedPressed,
              icon: Icon(
                Icons.close,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            child: Text('child'),
          ),
        ),
      ),
    );
  }
}
