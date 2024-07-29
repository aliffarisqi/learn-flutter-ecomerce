import 'package:flutter/material.dart';

import 'curved_edges.dart';

class BCurvedEdgeWidget extends StatelessWidget {
  const BCurvedEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BCustomCurvedEdge(),
      child: child,
    );
  }
}
