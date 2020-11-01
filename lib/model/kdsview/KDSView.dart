class KDSViewResponse {
  List<KDSView> kdsViewList;

  KDSViewResponse({this.kdsViewList});
}

class KDSView {
  String name;
  double stockCounter;

  KDSView({this.name, this.stockCounter});
}
