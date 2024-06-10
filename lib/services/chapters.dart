const dummyPackList = [
  BookChapter(
    uuid: '1',
    name: 'Rats and Mice of Sulawesi',
    description: '48 species',
  ),
  BookChapter(
    uuid: '4',
    name: 'Shrews of Sulawesi',
    description: '21 species',
  ),
  BookChapter(
    uuid: '2',
    name: 'Mammals of Borneo',
    description: 'A field guide to the mammals of Borneo',
  ),
  BookChapter(
    uuid: '3',
    name: 'Mammals of Java',
    description: 'A field guide to the mammals of Java',
  ),
  BookChapter(
    uuid: '5',
    name: 'Mammals of Papua',
    description: 'A field guide to the mammals of Papua',
  )
];

class BookChapter {
  const BookChapter({
    required this.uuid,
    required this.name,
    required this.description,
  });

  final String uuid;
  final String name;
  final String description;
}
