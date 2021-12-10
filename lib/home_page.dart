import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Alpha',
    'Bravo',
    'Charlie',
    'Delta',
    'Echo',
    'Foxtrot',
    'Golf',
    'Hotel',
    'India',
    'Juliet',
    'Kilo',
    'Lima',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }


  // Executed when user pressed search button on soft keyboard
  @override
  Widget buildResults(BuildContext context) {
    print("Result build");
    List<String> matchQuery = [];

    for (String callSign in searchTerms) {
      if (callSign.toLowerCase().contains(query.toLowerCase()))
        matchQuery.add(callSign);
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        return ListTile(title: Text(result),);
      },
    );
  }


  // Executed everytime user inputted a character in textfield
  @override
  Widget buildSuggestions(BuildContext context) {
    print("Suggestion build");
    List<String> matchQuery = [];

    for (String callSign in searchTerms) {
      if (callSign.toLowerCase().contains(query.toLowerCase()))
        matchQuery.add(callSign);
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        return ListTile(title: Text(result),);
      },
    );
  }
}
