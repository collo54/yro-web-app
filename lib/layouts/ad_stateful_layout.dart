import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:yro/services/ad_state.dart';

class AdStatefulLayout extends StatefulWidget {
  @override
  _AdStatefulLayoutState createState() => _AdStatefulLayoutState();
}

class _AdStatefulLayoutState extends State<AdStatefulLayout> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context, listen: false);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            adUnitId: adState.bannerAdUnitId,
            size: AdSize.banner,
            request: AdRequest(),
            listener: adState.adListener)
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      if (banner == null)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          width: width,
          height: 100,
          child: _buildMessage(context),
        )
      else
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          width: width,
          height: 100,
          child: _buildAd(context),
        ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Text(
            "Ad",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black87),
          ),
        ),
      ),
    ]);
  }

  Widget _buildAd(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: AdWidget(ad: banner!))]);
  }
}
