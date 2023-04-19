import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

typedef _LoadedData = Widget Function(dynamic data);

class FutureDataLoader extends StatelessWidget {
  final Future future;
  final String loadingMessage;
  final String noDataMessage;
  final _LoadedData onDataLoaded;
  final double loadingMessagePadding;
  final double noMessagePadding;

  const FutureDataLoader({
    Key? key,
    required this.future,
    this.loadingMessage = 'Loading...',
    this.noDataMessage = 'No data found!',
    required this.onDataLoaded,
    this.loadingMessagePadding = 15,
    this.noMessagePadding = 15
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return <Widget>[
            const CircularProgressIndicator().width(20).height(20),
            const SizedBox(
              width: 12,
            ),
            Text(loadingMessage)
          ]
              .toRow()
              .padding(all: loadingMessagePadding)
              .parent(({required child}) => <Widget>[child].toColumn());
        }

        if (!snapshot.hasData) {
          return <Widget>[
            Icon(
              Icons.warning,
              color: Colors.amber.shade800,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(noDataMessage).textColor(Colors.redAccent)
          ]
              .toRow()
              .padding(all: noMessagePadding)
              .parent(({required child}) => <Widget>[child].toColumn());
        }

        if(snapshot.data is List){
          if((snapshot.data as List).isEmpty){
            return <Widget>[
              Icon(
                Icons.warning,
                color: Colors.amber.shade800,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(noDataMessage).textColor(Colors.redAccent)
            ]
                .toRow()
                .padding(all: noMessagePadding)
                .parent(({required child}) => <Widget>[child].toColumn());
          }
        }

        return onDataLoaded(snapshot.data!);
      },
    );
  }
}
