class Channel {
  final String channelName;
  final String channelImageUrl;

  const Channel({
    required this.channelName,
    required this.channelImageUrl,
  });
}

const Channel channel = Channel(
  channelName: 'Code With Ammar',
  channelImageUrl:
      'https://yt3.ggpht.com/ytc/AKedOLSIvDOv8HrJ5sBczgJadyqVZUYqtbOHotgew67D=s900-c-k-c0x00ffffff-no-rj',
);

class Video {
  final String id;
  final Channel channel;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String channelName;
  final String channelImageUrl;
  final String videoUrl;

  const Video(
      {required this.id,
      required this.channel,
      required this.title,
      required this.thumbnailUrl,
      required this.duration,
      required this.timestamp,
      required this.viewCount,
      required this.channelName,
      required this.channelImageUrl,
      required this.videoUrl});
}

final List<Video> videos = [
  Video(
      id: 'fRtM8pI4hmA',
      channel: channel,
      title: 'عدية سورة يس ٤١ مرة لقضاء أصعب الحوائج',
      thumbnailUrl: 'https://img.youtube.com/vi/fRtM8pI4hmA/0.jpg',
      duration: '11:07:24',
      timestamp: DateTime(2023, 4, 10),
      viewCount: '453K',
      channelName: 'إذاعة البحر المتوسط من مالمو',
      channelImageUrl:
          'https://yt3.googleusercontent.com/oBfyHKPTpOOZlrEFo1emt-HBnqvvVWX6upSIgMNfty2gpSRz0lS5WzjYnG8fNilOxzAQ6ECjWA=s176-c-k-c0x00ffffff-no-rj',
      videoUrl: 'https://youtu.be/fRtM8pI4hmA?si=C-wdAatILd_lO58t'),
  Video(
      channel: channel,
      id: 's1Fq4gzNzrI',
      title: 'أحمد الشقيري عدم فقدان الأمل',
      thumbnailUrl: 'https://img.youtube.com/vi/s1Fq4gzNzrI/0.jpg',
      duration: '08:30',
      timestamp: DateTime(2023, 4, 12),
      viewCount: '1.19M',
      channelName: 'Afkar',
      channelImageUrl:
          'https://yt3.ggpht.com/ytc/AOPolaQojF9285RqFJ2k6xXS_nRsHkq0QpNIG_6jXtQqhA=s88-c-k-c0x00ffffff-no-rj',
      videoUrl: 'https://youtu.be/s1Fq4gzNzrI?si=az1vRW6WLYnjRBf1'),
  Video(
      id: 'pJ0auP7dbcY',
      channel: channel,
      title: 'كيف تنجح العلاقات مع ياسر الحزيمي | بودكاست فنجان',
      thumbnailUrl: 'https://img.youtube.com/vi/pJ0auP7dbcY/0.jpg',
      duration: '3:03:08',
      timestamp: DateTime(2022, 11, 16),
      viewCount: '3.37 M',
      channelName: 'إذاعة ثمانية',
      channelImageUrl:
          'https://yt3.ggpht.com/ytc/AOPolaQpOyUzDhLCVPRM3jVTKYefrUr1OJNTLmwYkieG8A=s88-c-k-c0x00ffffff-no-rj',
      videoUrl: 'https://youtu.be/pJ0auP7dbcY?si=LLYIHt4MwqzEFp91'),
  Video(
      id: 'sGn4pQ3XIn0',
      channel: channel,
      title: 'احمد الشقيري اجمل المقاطع التحفيزية | Ahmed Al-Shugairi',
      thumbnailUrl: 'https://img.youtube.com/vi/sGn4pQ3XIn0/0.jpg',
      duration: '5:52',
      timestamp: DateTime(2012, 3, 01),
      viewCount: '70.1K',
      channelName: 'OMAR | Motivation',
      channelImageUrl:
          'https://yt3.ggpht.com/nfOTRtTJa94e0xgWNuDQNoA0xMD3uiWt4c9jIAqo0fluGnZ1TTtHLmuXVgcOwINULrRI1YnNyw=s88-c-k-c0x00ffffff-no-rj',
      videoUrl: 'https://www.youtube.com/watch?v=sGn4pQ3XIn0'),
  Video(
      id: '99cqOy4viF0',
      channel: channel,
      title: 'احمد الشقيري إكتشف سبب الذي يجعلك ترتكب هذه الأخطاء',
      thumbnailUrl: 'https://img.youtube.com/vi/99cqOy4viF0/0.jpg',
      duration: '9:05',
      timestamp: DateTime(2022, 1, 29),
      viewCount: '1.19M',
      channelName: 'Afkar',
      channelImageUrl:
          'https://yt3.ggpht.com/ytc/AOPolaQojF9285RqFJ2k6xXS_nRsHkq0QpNIG_6jXtQqhA=s88-c-k-c0x00ffffff-no-rj',
      videoUrl: 'https://www.youtube.com/watch?v=99cqOy4viF0'),
];
