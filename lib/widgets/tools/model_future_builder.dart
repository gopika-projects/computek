import 'package:flutter/material.dart';

class ModelFutureBuilder<T> extends StatelessWidget {
  const ModelFutureBuilder({
    Key? key,
    required this.busy,
    required this.data,
    required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  final bool busy;
  final T? data;
  final Widget? error;
  final Widget? loading;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return loading ?? Center(child: CircularProgressIndicator());
    } else {
      if (data == null) {
        return error ?? Center(child: Text('Something went wrong'));
      } else {
        return builder(context, data!, null);
      }
    }
  }
}

class ModelFutureListBuilder<T> extends StatelessWidget {
  const ModelFutureListBuilder({
    Key? key,
    required this.busy,
    required this.data,
    required this.builder,
    this.empty,
    this.loading,
  }) : super(key: key);

  final bool busy;
  final List<T> data;
  final Widget? empty;
  final Widget? loading;
  final ValueWidgetBuilder<List<T>> builder;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return loading ?? Center(child: CircularProgressIndicator());
    } else {
      if (data.isEmpty) {
        return empty ?? Center(child: Text('List is empty'));
      } else {
        return builder(context, data, null);
      }
    }
  }
}
