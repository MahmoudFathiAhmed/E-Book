class Items {
  String? id;
  String? selfLink;
  String? title;
  String? author;
  String? category;
  String? description;
  String? thumbnail;
  String? downloadLink;
  String? previewLink;

  Items(
      {this.id,
        this.selfLink,
        this.title,
        this.author,
        this.category,
        this.description,
        this.thumbnail,
        this.downloadLink,
        this.previewLink});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selfLink = json['selfLink'];
    title = json['title'];
    author = json['author'];
    category = json['category'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    downloadLink = json['downloadLink'];
    previewLink = json['previewLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['selfLink'] = this.selfLink;
    data['title'] = this.title;
    data['author'] = this.author;
    data['category'] = this.category;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['downloadLink'] = this.downloadLink;
    data['previewLink'] = this.previewLink;
    return data;
  }
}