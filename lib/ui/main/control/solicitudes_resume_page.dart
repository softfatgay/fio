import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

class SolicitudesResumePage extends StatefulWidget {
  final Map? params;

  const SolicitudesResumePage({Key? key, this.params}) : super(key: key);

  @override
  State<SolicitudesResumePage> createState() => _SolicitudesResumePageState();
}

class _SolicitudesResumePageState extends State<SolicitudesResumePage> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text(
          'Resumen de la solicitud',
          style: t18black,
        ),
        titleSpacing: 0,
        backgroundColor: appWhite,
      ),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _labelTitle('Common user data'),
          _labelFiled('Name', 'Name of user common 1'),
          const SizedBox(height: 10),
          _labelFiled('D.N.I.', 'Write a d.n.i.'),
          const SizedBox(height: 10),
          _labelFiled('Date of birth', 'dd/mm/yy'),
          const SizedBox(height: 10),
          _labelFiled('Date of control', 'dd/mm/yy'),
          const SizedBox(height: 10),
          _labelFiled('Data 1', 'text'),
          const SizedBox(height: 10),
          _labelFiled('Data 2', 'text2'),
          const SizedBox(height: 10),
          _labelFiled('Data 3', 'text3'),
          const SizedBox(height: 10),
          _labelFiled('Data 4', 'text4'),
          _labelTitle('Common user data'),
          const SizedBox(height: 10),
          _labelFiled('Localidad', 'Write a location'),
          const SizedBox(height: 10),
          _labelFiled('Barrio', 'Write a location'),
          _labelTitle('Common user data'),
          const SizedBox(height: 10),
          _labelFiled('Name', ''),
          const SizedBox(height: 10),
          _labelFiled('D.N.I.', ''),
          const SizedBox(height: 10),
          _labelFiled('D.N.I.', ''),
          const SizedBox(height: 10),
          _labelFiled('D.N.I.', ''),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: NormalButton(
                text: 'Send This Data', elevation: 0, onPressed: () {}),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: NormalButton(
                text: 'Save Draft',
                color: appWhite,
                textColor: textGrey,
                elevation: 0,
                onPressed: () {}),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Terms of Use',style: t16black,),
                Text('Privacy Policy',style: t16black,),
              ],
            ),
          )
        ],
      ),
    );
  }

  _labelTitle(String text) {
    return Container(
      width: double.maxFinite,
      color: backColor,
      padding:
          EdgeInsets.symmetric(vertical: 20, horizontal: ScreenMargin.TOSCREEN),
      child: Text(
        '$text',
        style: t18black,
      ),
    );
  }

  _labelFiled(String preText, String hint) {
    return Container(
      color: appWhite,
      padding:
          EdgeInsets.symmetric(vertical: 6, horizontal: ScreenMargin.TOSCREEN),
      child: Row(
        children: [
          Text(
            '$preText',
            style: t16black,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                  controller: _nameController,
                  style: t16black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '$hint',
                    hintStyle: t16grey,
                  )),
            ),
          )
        ],
      ),
    );
  }

  _splitLine() {
    return Container(
      height: 10,
      color: backColor,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }
}
