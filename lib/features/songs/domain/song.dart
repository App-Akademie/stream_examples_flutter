class Song {
  final String title;
  final String artist;

  Song(this.title, this.artist);

  @override
  String toString() {
    return '$title - $artist';
  }
}
