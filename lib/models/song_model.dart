// models/song_model.dart
class Song {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final String tag;
  final String audioUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.tag,
    required this.audioUrl,
  });
  @override
  bool operator == (Object other) =>
       identical(this, other) ||
       other is Song && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

final List<Song> sampleSongs = [
  Song(
    id: '1',
    title: 'Midnight Coding Beats',
    artist: 'Lo-Fi Chill Hop',
    coverUrl: 'https://picsum.photos/id/145/800/600',
    tag: 'Trending',
    audioUrl: "audio/I Miss You Every Brand New Day - From _Spider-Man_ Brand New Day_ Movie_spotdown.org.mp3"
  ),
  Song(
    id: '2',
    title: 'Cyberpunk Synthwave',
    artist: 'Neon Vibe Studio',
    coverUrl: 'https://picsum.photos/id/1067/800/600',
    tag: 'Popular',
    audioUrl: "audio/Sesaat Kau Hadir_spotdown.org.mp3"
  ),
  Song(
    id: '3',
    title: 'Acoustic Coffee Break',
    artist: 'Indie Chill',
    coverUrl: 'https://picsum.photos/id/225/800/600',
    tag: 'Relax',
    audioUrl: "audio/SHOUT OUT_spotdown.org.mp3"
  ),
];