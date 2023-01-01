import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GraphQLState();
  }
}

class GraphQLState extends State<GraphQLScreen> {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: GraphQLCache(
            store: HiveStore(),
            partialDataPolicy: PartialDataCachePolicy.acceptForOptimisticData),
      ),
    );
    return GraphQLProvider(
      child: GraphQLWidget(),
      client: client,
    );
  }
}

class GraphQLWidget extends StatelessWidget {
  final String query = r"""
                    query GetContinent($code : ID!){
                      continent(code:$code){
                        name
                        countries{
                          name
                          code
                        }
                      }
                    }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(message: StringConstants.screenGraphQL),
      body: Query(
        options: QueryOptions(
          document: gql(query),
          variables: const <String, dynamic>{"code": "AF"},
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          print("Query >> ");
          if (result.hasException) {
            print(result.exception.toString());
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            print("Loading >> ");
            return Center(child: CircularProgressIndicator());
          }
          if (result.data == null) {
            return Center(child: Text("No Data Found !"));
          }

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                      result.data!['continent']['countries'][index]['name']),
                  subtitle: Text(
                      result.data!['continent']['countries'][index]["code"]),
                ),
              );
            },
            itemCount: result.data!['continent']['countries'].length,
          );
        },
      ),
    );
  }
}
