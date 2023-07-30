import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/colors.dart';

import '../../constant/screen_margin.dart';

class AddoticePage extends StatefulWidget {
  const AddoticePage({Key? key}) : super(key: key);

  @override
  State<AddoticePage> createState() => _AddoticePageState();
}

class _AddoticePageState extends State<AddoticePage> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();

  List<XFile> _mediaFileList = [];
  List _data = [''];
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Añadir noticia',
          style: t16black,
        ),
      ),
      body: _buildContent(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN,vertical: 20),
        width: double.maxFinite,
        child: NormalButton(
        text: 'Publish Notice',
          onPressed: (){}),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _buildContent() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
              child: Text(
                'Add photos',
                style: t14black,
              ),
            ),
            const SizedBox(height: 12),
            _buildGridleView(),
            const SizedBox(height: 25),
            _labelFiled('Title', '', _titleController),
            const SizedBox(height: 12),
            _desFiled('Description', '', _desController),
          ],
        ),
      ),
    );
  }

  _buildGridleView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: getItem,
      ),
    );
  }

  Widget getItem(context, index) {
    print(_data[index]);
    return Container(
      color: appWhite,
      child: index == _data.length - 1
          ? IconButton(
              onPressed: () {
                _pickImage();
              },
              icon: Icon(
                Icons.add,
                size: 30,
              ))
          : Container(
              color: appWhite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.file(
                    File(_data[index].path),
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(
                          child: Text('This image type is not supported'));
                    },
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _deleteImage(index);
                        },
                      ))
                ],
              ),
            ),
    );
  }

  _labelFiled(
    String preText,
    String hint,
    TextEditingController controller,
  ) {
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
                  controller: controller,
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

  _desFiled(String preText, String hint, TextEditingController controller) {
    return Container(
      width: double.maxFinite,
      color: appWhite,
      padding:
          EdgeInsets.symmetric(vertical: 6, horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$preText',
            style: t16black,
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 100
            ),
            width: double.maxFinite,
            child: TextField(
                controller: controller,
                style: t16black,
                maxLength: 1000,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '$hint',
                  hintStyle: t16grey,
                )),
          )
        ],
      ),
    );
  }

  _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: null,
      maxHeight: null,
      imageQuality: null,
    );
    _setMediaFile(pickedFile);
  }

  _setMediaFile(XFile? pickedFile) {
    setState(() {
      if (pickedFile != null) {
        _mediaFileList.add(pickedFile);
        _data.insert(_data.length - 1, pickedFile);
      }
    });
  }

  void _deleteImage(index) {
    setState(() {
      _mediaFileList.removeAt(index);
      _data.removeAt(index);
    });
  }
}
