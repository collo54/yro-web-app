import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/layouts/add_firestoredata.dart';
import 'package:yro/models/contributor_model.dart';
import 'package:yro/pages/add_contributions_page.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/widgets/avator_widget.dart';
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

  Future<void> _delete(BuildContext context, Contributor contributor) async {
    final database = Provider.of<FirestoreService>(context, listen: false);
    await database.deleteContibutor(contributor);
  }

  Widget _buildUserInfo({BuildContext context}) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context, listen: false);
    return StreamBuilder<List<Contributor>>(
      stream: firestoreservice.contributorsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final contributor = snapshot.data;
          if (contributor.isNotEmpty) {
            final children = contributor
                .map(
                  (contribution) => Dismissible(
                    key: Key('contribution-${contribution.id}'),
                    background: Container(color: Colors.red),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) => _delete(context, contribution),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 300,
                            width: 1400,
                            child: TopUpCard(
                              contributor: contribution,
                              onTap: () => AddContributionsPage.show(context,
                                  contributor: contribution),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 30),
                          child: AvatorWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: AddFirestoreData(),
                        ),
                      ],
                    ),
                  ),
                )
                .toList();
            return Column(
              children: children,
            );
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 300,
                  width: 1400,
                  child: TopUpCard(
                    contributor: Contributor(
                        id: '0',
                        name: 'name',
                        contributionPerMonth: 0,
                        deposited: 0,
                        withdrawn: 0),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: AvatorWidget(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: AddFirestoreData(),
              ),
            ],
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
