import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/search_index_widget.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

class SearchIndexPage extends StatefulWidget {
  const SearchIndexPage({Key? key}) : super(key: key);

  @override
  State<SearchIndexPage> createState() => _SearchIndexPageState();
}

class _SearchIndexPageState extends State<SearchIndexPage> {
  final _searchTextController = TextEditingController();
  var _textValue = '';
  final _scrollController = ScrollController();
  var _isSearchResult = false;

  List<dynamic> _searchTipsData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _searchKey() async {
    var params = {
      'keywordPrefix': _textValue,
      '__timestamp': DateTime.now().millisecondsSinceEpoch
    };
    var dio = Dio();
    String url = 'https://m.you.163.com/xhr/search/searchAutoComplete.json';
    var response = await dio.post(url, queryParameters: params);
    setState(() {
      _searchTipsData = response.data['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backColor,
          automaticallyImplyLeading: false,
          title: SearchIndexWidget(
            controller: _searchTextController,
            onValueChangedCallBack: (searchText) {
              setState(() {
                _textValue = searchText;
              });
              if (_textValue.isNotEmpty) {
                _searchKey();
              }
            },
          )),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
        child: _textValue.isEmpty ? _buildHistory() : _showResult());
  }

  _buildHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: ScreenMargin.TOSCREEN),
          child: Text(
            'Search history',
            style: t16black,
          ),
        )
      ],
    );
  }

  _showResult() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: _searchTipsData.map<Widget>((item) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey[200]!),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '$item',
                        textAlign: TextAlign.start,
                        style: t16black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    )
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }
}
