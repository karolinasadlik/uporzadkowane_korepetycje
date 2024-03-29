class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'notatka nr 1',
    content: 'elllo',
    modifiedTime: DateTime(2022, 3, 7),
  ),
  Note(
    id: 1,
    title: 'notatka nr 2',
    content: '1. piesek ',
    modifiedTime: DateTime(2024, 3, 4),
  ),
  Note(
    id: 2,
    title: 'notatka nr 3',
    content:
        '1. Kanada to idealne miejsce dla miłośników natury, niesamowitych widoków, dzikich zwierząt i wszelkich form aktywnego wypoczynku. Ale czekają tu na was także pełne atrakcji i niespodzianek miasta, niezwykłe muzea z eksponatami liczącymi miliardy lat, a także wielkie widowiska sezonowe. W Kanadzie jest co robić o każdej porze roku, także jesienią i zimą. Zapraszamy do galerii 16 najbardziej niesamowitych atrakcji Kanady. Sprawdźcie też, co warto wiedzieć o tym kraju, jego stolicy, fladze czy strefach czasowych.',
    modifiedTime: DateTime(2010, 1, 7),
  ),
];
