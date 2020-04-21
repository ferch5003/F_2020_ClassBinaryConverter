import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/models/layout_model.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutModel>(
        create: (context) => LayoutModel(),
        child: Consumer<LayoutModel>(
          builder: (context, layoutModel, child) {
            return Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text("${layoutModel.text}",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          onPressed: () {
                            layoutModel.changeView();
                          },
                        )),
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${layoutModel.binary}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                              fontSize: 35),
                        )),
                    Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${layoutModel.decimal}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                                fontSize: 35))),
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: double.infinity,
                          child: layoutModel.getCustomContainer(),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              layoutModel.convertion(3, null);
                            },
                            child: Text("Reset",
                                style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ]),
            );
          },
        ));
  }
}
