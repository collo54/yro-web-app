import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/contributor_model.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/widgets/top_up_card.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(400.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildUserInfo(context: context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUserInfo({BuildContext context}) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context, listen: false);
    return StreamBuilder<List<Contributor>>(
      stream: firestoreservice.contributorsStream(),
      initialData: <Contributor>[
        Contributor(name: 'name', contributionsPerMonth: 0)
      ],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final contributor = snapshot.data;
          final children = contributor
              .map((contribution) => TopUpCard(
                    balance: contribution.name,
                    income: contribution.contributionsPerMonth.toString(),
                    expense: contribution.contributionsPerMonth.toString(),
                  ))
              .toList();
          return Column(
            children: children,
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Some error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
