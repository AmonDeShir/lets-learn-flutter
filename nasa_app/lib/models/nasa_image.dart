// Generated by https://app.quicktype.io
import 'dart:convert';

NasaImages nasaImagesFromJson(String str) => NasaImages.fromJson(json.decode(str));

class NasaImages {
    List<Item> items;

    NasaImages({
        required this.items,
    });

    factory NasaImages.fromJson(Map<String, dynamic> json) => NasaImages(
        items: List<Item>.from(json["collection"]["items"].where(Item.exists).map((x) => Item.fromJson(x))),
    );
}

class Item {
    List<Datum> data;
    String link;

    Item({
      required this.data,
      required this.link,
    });

    static bool exists(dynamic json) {
      return json["links"]?[0]?["href"] != null;
    }

    factory Item.fromJson(Map<String, dynamic> json) => Item(
      data: List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x)) ?? List.empty()),
      link: json["links"][0]["href"],
    );
}

class Datum {
    String description;
    String title;
    String? photographer;
    String? location;
    String nasaId;
    DateTime dateCreated;

    Datum({
        required this.description,
        required this.title,
        this.photographer,
        this.location,
        required this.nasaId,
        required this.dateCreated,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        description: json["description"],
        title: json["title"],
        photographer: json["photographer"],
        location: json["location"],
        nasaId: json["nasa_id"],
        dateCreated: DateTime.parse(json["date_created"]),
    );
}

class CollectionLink {
    String rel;
    String prompt;
    String href;

    CollectionLink({
        required this.rel,
        required this.prompt,
        required this.href,
    });

    factory CollectionLink.fromJson(Map<String, dynamic> json) => CollectionLink(
      rel: json["rel"],
      prompt: json["prompt"],
      href: json["href"],
    );
}

class Metadata {
    int totalHits;

    Metadata({
        required this.totalHits,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        totalHits: json["total_hits"],
    );

    Map<String, dynamic> toJson() => {
        "total_hits": totalHits,
    };
}