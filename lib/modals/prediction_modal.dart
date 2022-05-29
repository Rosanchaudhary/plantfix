class Predict {
  String filePathName;
  String predictedLabel;
  String index;
  Predict(this.filePathName, this.predictedLabel,this.index);
  factory Predict.fromJson(dynamic json) {
    return Predict(json['filePathName'] as String, json['predictedLabel'],json['index']);
  }
  @override
  String toString() {
    return '{ ${this.filePathName}, ${this.predictedLabel} ,${this.index}}';
  }
}
