// To parse this JSON data, do
//
//     final Modeloepisode = ModeloepisodeFromJson(jsonString);
import 'dart:convert';

ModeloEpisode modeloEpisodeFromJson(String str) => ModeloEpisode.fromJson(json.decode(str));

String modeloEpisodeToJson(ModeloEpisode data) => json.encode(data.toJson());

class ModeloEpisode {
    final int id;
    final String name;
    final String airDate;
    final String episode;
    final List<String> characters;
    final String url;
    final DateTime created;

    ModeloEpisode({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episode,
        required this.characters,
        required this.url,
        required this.created,
    });

    factory ModeloEpisode.fromJson(Map<String, dynamic> json) => ModeloEpisode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["Modeloepisode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}
