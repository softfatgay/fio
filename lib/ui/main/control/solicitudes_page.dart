import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

class SolicitudesPage extends StatefulWidget {
  const SolicitudesPage({Key? key}) : super(key: key);

  @override
  State<SolicitudesPage> createState() => _SolicitudesPageState();
}

class _SolicitudesPageState extends State<SolicitudesPage>
    with TickerProviderStateMixin {
  final _tabs = ['Pendientes', 'Revision', 'Cargadas'];

  var _data = ['', '', '', '', '123'];

  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          'Solicitudes',
          style: t18black,
        ),
        titleSpacing: 0,
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: appWhite,
        ),
        backgroundColor: appBlue,
        shape: const StadiumBorder(),
      ),
    );
  }

  _buildContent() {
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: _controller,
            indicatorColor: appBlue,
            labelColor: textBlue,
            unselectedLabelColor: textGrey,
            dividerColor: backColor,
            labelStyle: TextStyle(fontSize: 16),
            tabs: _tabs
                .map<Widget>((e) => Tab(
                      child: Container(
                        alignment: Alignment.center,
                        height: 34,
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: _tabs
                  .map((e) => SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              color: appWhite,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: ScreenMargin.TOSCREEN),
                              child: Text(
                                '2 nuevas solicitudes',
                                style: t16black,
                              ),
                            ),
                            Column(
                              children: _data
                                  .map<Widget>(
                                    (e) => GestureDetector(
                                      child: _buildItem(e),
                                      onTap: () {
                                        Routers.push(context, Routers.solicitudesResumePage);
                                      },
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(String e) {
    return Container(
      height: 74,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: appWhite, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Sheila rom',
                      style: t16black,
                    ),
                    Text(
                      '(Common user)',
                      style: t16blackMin,
                    ),
                  ],
                ),
                if (e != '123')
                  Container(
                    child: Text(
                      'Pendiente',
                      style: t16Red,
                    ),
                  )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
